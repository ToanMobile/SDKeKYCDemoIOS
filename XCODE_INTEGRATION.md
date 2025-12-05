# Xcode Integration Guide - Fix Info.plist for iOS 26.1+

## Vấn đề

Khi sử dụng Swift Package Manager (SPM) để tích hợp eKYC SDK, frameworks được embed vào app bundle. Tuy nhiên, iOS 26.1+ yêu cầu các frameworks phải có đầy đủ keys trong `Info.plist`:

- `CFBundlePackageType = "FMWK"`
- `CFBundleExecutable`
- `CFBundleSupportedPlatforms`
- `UIDeviceFamily`
- Và các keys khác

Nếu thiếu các keys này, app sẽ không thể cài đặt lên device với lỗi:
```
Info.plist from bundle at path .../Ekyc.framework had none of the keys that we expect
Domain: MIInstallerErrorDomain
Code: 35
```

## Giải pháp

Thêm **Run Script Build Phase** vào Xcode project để tự động fix Info.plist sau khi embed frameworks.

## Cách thêm vào Xcode Project

### Bước 1: Copy script vào project

1. Copy file `fix_frameworks_infoplist.sh` từ distribution vào project của bạn:
   ```bash
   cp EkycSDK-Distribution/fix_frameworks_infoplist.sh YourProject/
   ```

2. Hoặc thêm script vào Xcode project (drag & drop vào project)

### Bước 2: Thêm Run Script Build Phase

1. Mở Xcode project
2. Chọn **Target** của app
3. Vào tab **Build Phases**
4. Click **+** → Chọn **New Run Script Phase**
5. Kéo Run Script phase xuống **sau** "Embed Frameworks" phase
6. Đặt tên: "Fix Frameworks Info.plist"
7. Thêm script:

```bash
# Fix Info.plist for embedded frameworks
if [ -f "${SRCROOT}/fix_frameworks_infoplist.sh" ]; then
    "${SRCROOT}/fix_frameworks_infoplist.sh"
elif [ -f "${SRCROOT}/EkycSDK-Distribution/fix_frameworks_infoplist.sh" ]; then
    "${SRCROOT}/EkycSDK-Distribution/fix_frameworks_infoplist.sh"
else
    echo "Warning: fix_frameworks_infoplist.sh not found"
fi
```

### Bước 3: Verify

1. Build project (⌘+B)
2. Kiểm tra build log - bạn sẽ thấy:
   ```
   Fixing Info.plist for frameworks in: ...
   ✓ Fixed Ekyc.framework
   ✓ Fixed SDKCore.framework
   ...
   Info.plist fix complete
   ```

3. Archive và cài đặt lên device - lỗi Code 35 sẽ không còn xuất hiện

## Alternative: Inline Script

Nếu không muốn copy file riêng, bạn có thể paste script trực tiếp vào Run Script phase:

```bash
# Fix Info.plist for all embedded frameworks
APP_BUNDLE="${BUILT_PRODUCTS_DIR}/${WRAPPER_NAME}"
FRAMEWORKS_DIR="${APP_BUNDLE}/Frameworks"

if [ ! -d "${FRAMEWORKS_DIR}" ]; then
    exit 0
fi

SDK_NAME="iphoneos"
SDK_VERSION=$(xcodebuild -version -sdk "${SDK_NAME}" SDKVersion 2>/dev/null || echo "26.1")
SDK_BUILD=$(xcodebuild -version -sdk "${SDK_NAME}" ProductBuildVersion 2>/dev/null || echo "23B77")
PLATFORM_NAME="iPhoneOS"

find "${FRAMEWORKS_DIR}" -name "*.framework" -type d | while read framework_path; do
    info_plist="${framework_path}/Info.plist"
    if [ ! -f "${info_plist}" ]; then
        continue
    fi
    
    framework_name=$(basename "${framework_path}" .framework)
    
    # Ensure CFBundlePackageType is FMWK
    /usr/libexec/PlistBuddy -c "Set :CFBundlePackageType FMWK" "${info_plist}" 2>/dev/null || \
    /usr/libexec/PlistBuddy -c "Add :CFBundlePackageType string FMWK" "${info_plist}" 2>/dev/null || true
    
    # Ensure CFBundleExecutable
    if ! /usr/libexec/PlistBuddy -c "Print :CFBundleExecutable" "${info_plist}" >/dev/null 2>&1; then
        /usr/libexec/PlistBuddy -c "Add :CFBundleExecutable string ${framework_name}" "${info_plist}" 2>/dev/null || true
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
    
    # Convert to binary format
    plutil -convert binary1 "${info_plist}" 2>/dev/null || true
    
    echo "✓ Fixed ${framework_name}.framework"
done

echo "Info.plist fix complete"
```

## Troubleshooting

### Script không chạy

- Đảm bảo Run Script phase nằm **sau** "Embed Frameworks"
- Kiểm tra "Shell" là `/bin/sh` hoặc `/bin/bash`
- Đảm bảo "Show environment variables in build log" được bật để debug

### Script không tìm thấy frameworks

- Kiểm tra `BUILT_PRODUCTS_DIR` và `WRAPPER_NAME` có đúng không
- Thử build và xem log để debug

### Vẫn bị lỗi Code 35

- Kiểm tra script đã chạy chưa (xem build log)
- Verify Info.plist sau khi build:
  ```bash
  /usr/libexec/PlistBuddy -c "Print :CFBundlePackageType" \
    YourApp.app/Frameworks/Ekyc.framework/Info.plist
  ```
  Phải trả về: `FMWK`

## Notes

- Script này chỉ cần chạy cho **iOS device builds**, không cần cho Simulator
- Script tự động detect SDK version từ Xcode environment
- Script chỉ fix frameworks thiếu keys, không ảnh hưởng frameworks đã đầy đủ

---

**Last Updated:** 2025-12-05  
**SDK Version:** 1.0.21+  
**iOS Version:** 26.1+
