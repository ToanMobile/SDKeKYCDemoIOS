# ═══════════════════════════════════════════════════════════
# EkycSDK iOS 26.1+ Auto-Fix Hook
# 
# CÁCH DÙNG: Copy toàn bộ đoạn này vào Podfile của app
# 
# Podfile:
#   source 'git@github.com:GalaxyHolding/ekyc-ios-specs.git'
#   source 'https://cdn.cocoapods.org/'
#   
#   platform :ios, '14.0'
#   use_frameworks!
#   
#   target 'YourApp' do
#     pod 'EkycSDK', '~> 1.0.6'
#   end
#   
#   # COPY ĐOẠN DƯỚI ĐÂY VÀO CUỐI PODFILE ↓
# ═══════════════════════════════════════════════════════════

post_install do |installer|
  puts ""
  puts "🔧 [EkycSDK] Auto-configuring iOS 26.1+ fix..."
  
  # Find app targets in user project
  installer.aggregate_targets.each do |aggregate_target|
    aggregate_target.user_project.targets.each do |target|
      # Only process app targets
      next unless target.product_type == 'com.apple.product-type.application'
      next if target.name.include?('Pods')
      next if target.name.include?('Test')
      
      puts "  Processing target: #{target.name}"
      
      # Check if script already exists
      existing = target.shell_script_build_phases.find { |phase|
        phase.name == 'Fix Frameworks for iOS 26.1+'
      }
      
      if existing
        puts "    ✓ Already has fix script"
        next
      end
      
      # Add Run Script Build Phase
      phase = target.new_shell_script_build_phase('Fix Frameworks for iOS 26.1+')
      phase.shell_script = %q{#!/bin/bash
set -e
echo "🔧 Fixing frameworks for iOS 26.1+..."
FRAMEWORKS_DIR="${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}"
[ ! -d "${FRAMEWORKS_DIR}" ] && exit 0
SDK_VERSION=$(xcodebuild -version -sdk iphoneos SDKVersion 2>/dev/null || echo "26.1")
SDK_BUILD=$(xcodebuild -version -sdk iphoneos ProductBuildVersion 2>/dev/null || echo "23B85")
find "${FRAMEWORKS_DIR}" -name "*.framework" -type d -maxdepth 1 | while read FW; do
    INFO_PLIST="${FW}/Info.plist"
    [ ! -f "${INFO_PLIST}" ] && continue
    /usr/libexec/PlistBuddy -c "Print :CFBundleSupportedPlatforms" "${INFO_PLIST}" >/dev/null 2>&1 && continue
    FW_NAME=$(basename "${FW}" .framework)
    echo "  🔧 ${FW_NAME}..."
    /usr/libexec/PlistBuddy -c "Add :CFBundleSupportedPlatforms array" "${INFO_PLIST}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :CFBundleSupportedPlatforms:0 string iPhoneOS" "${INFO_PLIST}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :UIDeviceFamily array" "${INFO_PLIST}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :UIDeviceFamily:0 integer 1" "${INFO_PLIST}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :UIDeviceFamily:1 integer 2" "${INFO_PLIST}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :DTSDKName string iphoneos${SDK_VERSION}" "${INFO_PLIST}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :DTPlatformName string iphoneos" "${INFO_PLIST}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :DTPlatformVersion string ${SDK_VERSION}" "${INFO_PLIST}" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :DTSDKBuild string ${SDK_BUILD}" "${INFO_PLIST}" 2>/dev/null || true
    plutil -convert binary1 "${INFO_PLIST}" 2>/dev/null || true
    echo "  ✅ ${FW_NAME}"
done
echo "✅ Done!"}
      
      # Move phase to end (after Embed Frameworks)
      target.build_phases.move(phase, target.build_phases.count - 1)
      
      puts "    ✅ Added Build Phase 'Fix Frameworks for iOS 26.1+'"
    end
    
    # Save project
    aggregate_target.user_project.save
  end
  
  puts ""
  puts "✅ [EkycSDK] iOS 26.1+ fix configured automatically!"
  puts "   Build Phase added to project - no manual steps needed!"
  puts ""
end
