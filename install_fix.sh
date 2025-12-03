#!/bin/bash

# Auto-Install iOS 26.1+ Fix to Xcode Project
# Tự động thêm Run Script Build Phase vào Xcode project
#
# Usage: bash install_fix.sh /path/to/YourApp.xcodeproj

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Auto-Install iOS 26.1+ Fix - eKYC SDK                    ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

PROJECT_PATH="$1"

if [ -z "${PROJECT_PATH}" ]; then
    echo -e "${YELLOW}Usage: bash install_fix.sh /path/to/YourApp.xcodeproj${NC}"
    echo ""
    echo "Example:"
    echo "  bash install_fix.sh ~/Projects/MyApp/MyApp.xcodeproj"
    echo ""
    echo "Script sẽ tự động:"
    echo "  ✓ Add Run Script Build Phase vào project"
    echo "  ✓ Script fix frameworks Info.plist cho iOS 26.1+"
    echo "  ✓ Config đúng order (sau Embed Frameworks)"
    exit 1
fi

if [ ! -d "${PROJECT_PATH}" ]; then
    echo -e "${RED}Error: Project not found: ${PROJECT_PATH}${NC}"
    exit 1
fi

echo -e "${GREEN}✓${NC} Project: $(basename "${PROJECT_PATH}")"
echo ""

# Check Ruby
if ! command -v ruby >/dev/null 2>&1; then
    echo -e "${RED}Error: Ruby not found${NC}"
    echo "Please install Ruby first"
    exit 1
fi

# Install xcodeproj gem if needed
echo "Checking xcodeproj gem..."
if ! ruby -e "require 'xcodeproj'" 2>/dev/null; then
    echo -e "${YELLOW}Installing xcodeproj gem...${NC}"
    sudo gem install xcodeproj
fi

echo -e "${BLUE}Adding Build Phase to project...${NC}"
echo ""

# Ruby script to modify project
ruby - "${PROJECT_PATH}" <<'RUBY'
require 'xcodeproj'

project_path = ARGV[0]
project = Xcodeproj::Project.open(project_path)

# Find app targets (exclude test, pods, frameworks)
app_targets = project.targets.select do |t|
  t.product_type == 'com.apple.product-type.application' && 
  !t.name.include?('Test') &&
  !t.name.include?('Pods')
end

if app_targets.empty?
  puts "❌ No app target found in project"
  exit 1
end

puts "Found #{app_targets.count} app target(s)"

app_targets.each do |target|
  puts "  Processing: #{target.name}"
  
  # Check if script already exists
  existing = target.shell_script_build_phases.find do |phase|
    phase.name == 'Fix Frameworks for iOS 26.1+'
  end
  
  if existing
    puts "    ✓ Already has fix script, skipping"
    next
  end
  
  # Add new Run Script Build Phase
  phase = target.new_shell_script_build_phase('Fix Frameworks for iOS 26.1+')
  phase.shell_script = <<-SCRIPT
#!/bin/bash
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
echo "✅ Done!"
  SCRIPT
  
  # Move phase to end (after Embed Frameworks)
  target.build_phases.move(phase, target.build_phases.count - 1)
  
  puts "    ✅ Added Run Script Build Phase"
  puts "       Name: 'Fix Frameworks for iOS 26.1+'"
  puts "       Order: After Embed Frameworks"
end

project.save
puts ""
puts "✅ Project saved successfully!"
RUBY

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  ✅ SUCCESS! Build Phase Added to Project                 ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo "Build Phase đã được thêm:"
    echo "  • Name: 'Fix Frameworks for iOS 26.1+'"
    echo "  • Location: Target → Build Phases (sau Embed Frameworks)"
    echo "  • Action: Fix frameworks Info.plist trong app bundle"
    echo ""
    echo "Next steps:"
    echo "  1. Open/Reload Xcode"
    echo "  2. Verify: Target → Build Phases"
    echo "  3. Clean: Product → Clean Build Folder (Cmd+Shift+K)"
    echo "  4. Build: Product → Build (Cmd+B)"
    echo "  5. Install on iOS 26.1 device"
    echo ""
    echo -e "${GREEN}✅ Không còn Code 35 errors!${NC}"
    echo ""
else
    echo ""
    echo -e "${RED}❌ Failed to modify project${NC}"
    echo "Please check if Ruby and xcodeproj gem are installed"
    echo "  gem install xcodeproj"
    exit 1
fi

