# eKYC iOS SDK - Binary Distribution

## 📦 Version 1.0.15

This distribution contains **binary frameworks** (.xcframework) for all eKYC modules.

## 🔒 Security

- ✅ Implementation code is completely hidden in binary format
- ✅ Only public API interfaces are visible
- ✅ High security - cannot reverse engineer easily
- ✅ All frameworks and resource bundles are properly codesigned
- ✅ Full `Info.plist` compliance with iOS 14.0+ and iOS 26.1+ requirements

## 📋 Modules

- `SDKCore` - Core functionality
- `Ekyc` - Main SDK (includes all modules)
- `Ocr` - OCR functionality
- `Nfc` - NFC chip reading
- `Liveness` - Face liveness detection
- `FaceService` - Face recognition service
- `C06` - C06 verification
- `QRCode` - QR code scanning
- `SDKUI` / `EkycUI` - UI components

### 🧩 Resource bundles (localization, assets)

- Localization và assets (images, JSON, `.strings`, v.v.) được đóng gói trong **resource bundle thuần** nằm **bên trong** các `.xcframework` (ví dụ: bundle cho `SDKCore`).
- Các resource bundle này:
  - **Chỉ chứa resources** (không chứa bất kỳ code/binary nào như `.framework`, `.dylib`, `.a`, `.swiftmodule`, v.v.).
  - Được embed và codesign **cùng framework chứa nó** (ví dụ `SDKCore.xcframework`), nên phía ứng dụng **không cần** (và không nên) tự ý codesign riêng cho bundle.
- Khi tích hợp qua SwiftPM hoặc thêm thủ công nguyên `.xcframework`, resource bundle sẽ tự được SDK load thông qua cơ chế nội bộ (ví dụ `LocalizationHelper`), không cần cấu hình gì thêm phía app.

### 📋 Framework Info.plist

Tất cả frameworks được build với `Info.plist` đầy đủ các key bắt buộc:
- **iOS 14.0+ standard keys**: `CFBundleExecutable`, `CFBundleIdentifier`, `CFBundleVersion`, `MinimumOSVersion`
- **iOS 26.1+ required keys**: `CFBundleSupportedPlatforms`, `UIDeviceFamily`, `DTSDKName`, `DTPlatformName`, `DTPlatformVersion`, `DTSDKBuild`
- SDK metadata tự động được detect từ Xcode environment khi build

## 🚀 Installation

### Swift Package Manager

Add to your `Package.swift`:

```swift
dependencies: [
    .package(
        url: "YOUR_GITHUB_REPO_URL",
        from: "1.0.15"
    )
]
```

Or in Xcode:
1. File → Add Package Dependencies
2. Enter repository URL
3. Select version 1.0.15
4. Add to target

## 📖 Usage

```swift
import Ekyc
import SDKCore

// Initialize SDK
SdkEkyc.initSDKEkyc {
    // SDK initialized
}

// Start eKYC flow
let config = EKYCConfigSDK(...)
SdkEkyc.startEkyc(
    ekycConfigSDK: config,
    callbackSuccess: { event, data in
        // Handle success
    },
    callbackError: { event, error in
        // Handle error
    }
)
```

## 📄 License

Proprietary - All rights reserved.

---

**Version:** 1.0.15  
**Build Date:** 2025-12-04  
**Support:** Contact eKYC team
