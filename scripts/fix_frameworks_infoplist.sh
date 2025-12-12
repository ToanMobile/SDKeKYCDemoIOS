#!/bin/bash

# Fix Info.plist for all embedded frameworks in app bundle
# This script should be added as a Run Script Build Phase in Xcode
# Run after "Embed Frameworks" phase

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Get app bundle path from environment
APP_BUNDLE="${BUILT_PRODUCTS_DIR}/${WRAPPER_NAME}"
FRAMEWORKS_DIR="${APP_BUNDLE}/Frameworks"

if [ ! -d "${FRAMEWORKS_DIR}" ]; then
    echo "No Frameworks directory found, skipping Info.plist fix"
    exit 0
fi

echo "Fixing Info.plist for frameworks in: ${FRAMEWORKS_DIR}"

# Get SDK info
SDK_NAME="iphoneos"
SDK_VERSION=$(xcodebuild -version -sdk "${SDK_NAME}" SDKVersion 2>/dev/null || echo "26.1")
SDK_BUILD=$(xcodebuild -version -sdk "${SDK_NAME}" ProductBuildVersion 2>/dev/null || echo "23B77")
PLATFORM_NAME="iPhoneOS"

# Find all .framework directories
FIXED_COUNT=0
SKIPPED_COUNT=0

while IFS= read -r -d '' framework_path; do
    info_plist="${framework_path}/Info.plist"
    
    if [ ! -f "${info_plist}" ]; then
        continue
    fi
    
    framework_name=$(basename "${framework_path}" .framework)
    
    # Check if already has all required keys
    needs_fix=0
    
    # Check CFBundlePackageType
    if ! /usr/libexec/PlistBuddy -c "Print :CFBundlePackageType" "${info_plist}" >/dev/null 2>&1; then
        needs_fix=1
    elif [ "$(/usr/libexec/PlistBuddy -c "Print :CFBundlePackageType" "${info_plist}" 2>/dev/null)" != "FMWK" ]; then
        needs_fix=1
    fi
    
    # Check CFBundleExecutable
    if ! /usr/libexec/PlistBuddy -c "Print :CFBundleExecutable" "${info_plist}" >/dev/null 2>&1; then
        needs_fix=1
    fi
    
    # Check CFBundleSupportedPlatforms
    if ! /usr/libexec/PlistBuddy -c "Print :CFBundleSupportedPlatforms" "${info_plist}" >/dev/null 2>&1; then
        needs_fix=1
    fi
    
    # Check UIDeviceFamily
    if ! /usr/libexec/PlistBuddy -c "Print :UIDeviceFamily" "${info_plist}" >/dev/null 2>&1; then
        needs_fix=1
    fi
    
    if [ ${needs_fix} -eq 0 ]; then
        echo "  ✓ ${framework_name}.framework - OK"
        SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
        continue
    fi
    
    echo "  Fixing ${framework_name}.framework..."
    
    # Backup
    cp "${info_plist}" "${info_plist}.backup" 2>/dev/null || true
    
    # Ensure CFBundlePackageType is FMWK
    /usr/libexec/PlistBuddy -c "Set :CFBundlePackageType FMWK" "${info_plist}" 2>/dev/null || \
    /usr/libexec/PlistBuddy -c "Add :CFBundlePackageType string FMWK" "${info_plist}" 2>/dev/null || true
    
    # Ensure CFBundleExecutable matches framework name
    if ! /usr/libexec/PlistBuddy -c "Print :CFBundleExecutable" "${info_plist}" >/dev/null 2>&1; then
        /usr/libexec/PlistBuddy -c "Add :CFBundleExecutable string ${framework_name}" "${info_plist}" 2>/dev/null || true
    fi
    
    # Ensure CFBundleIdentifier exists
    if ! /usr/libexec/PlistBuddy -c "Print :CFBundleIdentifier" "${info_plist}" >/dev/null 2>&1; then
        /usr/libexec/PlistBuddy -c "Add :CFBundleIdentifier string com.ekyc.${framework_name}" "${info_plist}" 2>/dev/null || true
    fi
    
    # Ensure CFBundleVersion exists
    if ! /usr/libexec/PlistBuddy -c "Print :CFBundleVersion" "${info_plist}" >/dev/null 2>&1; then
        /usr/libexec/PlistBuddy -c "Add :CFBundleVersion string 1" "${info_plist}" 2>/dev/null || true
    fi
    
    # Add CFBundleSupportedPlatforms
    /usr/libexec/PlistBuddy -c "Add :CFBundleSupportedPlatforms array" "${info_plist}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :CFBundleSupportedPlatforms:0 string ${PLATFORM_NAME}" "${info_plist}" 2>/dev/null || \
    /usr/libexec/PlistBuddy -c "Set :CFBundleSupportedPlatforms:0 string ${PLATFORM_NAME}" "${info_plist}" 2>/dev/null || true
    
    # Add UIDeviceFamily
    /usr/libexec/PlistBuddy -c "Add :UIDeviceFamily array" "${info_plist}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :UIDeviceFamily:0 integer 1" "${info_plist}" 2>/dev/null || \
    /usr/libexec/PlistBuddy -c "Set :UIDeviceFamily:0 integer 1" "${info_plist}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :UIDeviceFamily:1 integer 2" "${info_plist}" 2>/dev/null || \
    /usr/libexec/PlistBuddy -c "Set :UIDeviceFamily:1 integer 2" "${info_plist}" 2>/dev/null || true
    
    # Add SDK metadata
    /usr/libexec/PlistBuddy -c "Add :DTSDKName string ${SDK_NAME}${SDK_VERSION}" "${info_plist}" 2>/dev/null || \
    /usr/libexec/PlistBuddy -c "Set :DTSDKName string ${SDK_NAME}${SDK_VERSION}" "${info_plist}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :DTPlatformName string ${SDK_NAME}" "${info_plist}" 2>/dev/null || \
    /usr/libexec/PlistBuddy -c "Set :DTPlatformName string ${SDK_NAME}" "${info_plist}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :DTPlatformVersion string ${SDK_VERSION}" "${info_plist}" 2>/dev/null || \
    /usr/libexec/PlistBuddy -c "Set :DTPlatformVersion string ${SDK_VERSION}" "${info_plist}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :DTSDKBuild string ${SDK_BUILD}" "${info_plist}" 2>/dev/null || \
    /usr/libexec/PlistBuddy -c "Set :DTSDKBuild string ${SDK_BUILD}" "${info_plist}" 2>/dev/null || true
    
    # Add Xcode metadata
    XCODE_VERSION=$(xcodebuild -version | head -1 | awk '{print $2}' | sed 's/\.//' 2>/dev/null || echo "2610")
    XCODE_BUILD=$(xcodebuild -version | tail -1 | awk '{print $3}' 2>/dev/null || echo "17B100")
    /usr/libexec/PlistBuddy -c "Add :DTXcode string ${XCODE_VERSION}" "${info_plist}" 2>/dev/null || \
    /usr/libexec/PlistBuddy -c "Set :DTXcode string ${XCODE_VERSION}" "${info_plist}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :DTXcodeBuild string ${XCODE_BUILD}" "${info_plist}" 2>/dev/null || \
    /usr/libexec/PlistBuddy -c "Set :DTXcodeBuild string ${XCODE_BUILD}" "${info_plist}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :DTCompiler string com.apple.compilers.llvm.clang.1_0" "${info_plist}" 2>/dev/null || \
    /usr/libexec/PlistBuddy -c "Set :DTCompiler string com.apple.compilers.llvm.clang.1_0" "${info_plist}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :DTPlatformBuild string ${SDK_BUILD}" "${info_plist}" 2>/dev/null || \
    /usr/libexec/PlistBuddy -c "Set :DTPlatformBuild string ${SDK_BUILD}" "${info_plist}" 2>/dev/null || true
    
    # Convert to binary format
    plutil -convert binary1 "${info_plist}" 2>/dev/null || true
    
    # Verify fix
    verify_ok=1
    if ! /usr/libexec/PlistBuddy -c "Print :CFBundlePackageType" "${info_plist}" >/dev/null 2>&1 || \
       [ "$(/usr/libexec/PlistBuddy -c "Print :CFBundlePackageType" "${info_plist}" 2>/dev/null)" != "FMWK" ]; then
        verify_ok=0
    fi
    if ! /usr/libexec/PlistBuddy -c "Print :CFBundleExecutable" "${info_plist}" >/dev/null 2>&1; then
        verify_ok=0
    fi
    if ! /usr/libexec/PlistBuddy -c "Print :CFBundleSupportedPlatforms" "${info_plist}" >/dev/null 2>&1; then
        verify_ok=0
    fi
    
    if [ ${verify_ok} -eq 1 ]; then
        echo "  ✓ Fixed ${framework_name}.framework"
        FIXED_COUNT=$((FIXED_COUNT + 1))
        rm -f "${info_plist}.backup"
    else
        echo "  ✗ Failed to fix ${framework_name}.framework"
        if [ -f "${info_plist}.backup" ]; then
            mv "${info_plist}.backup" "${info_plist}"
        fi
    fi
    
done < <(find "${FRAMEWORKS_DIR}" -name "*.framework" -type d -print0)

if [ ${FIXED_COUNT} -gt 0 ]; then
    echo "✓ Fixed ${FIXED_COUNT} framework(s)"
fi
if [ ${SKIPPED_COUNT} -gt 0 ]; then
    echo "✓ Verified ${SKIPPED_COUNT} framework(s) (already OK)"
fi

echo "Info.plist fix complete"
