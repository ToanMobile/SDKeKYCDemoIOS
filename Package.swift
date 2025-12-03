// swift-tools-version:5.9
import PackageDescription

/// eKYC iOS Native SDK Package (Binary Distribution)
/// Version: 1.0.7
///
/// This package contains binary frameworks (.xcframework) for all eKYC modules.
/// Implementation code is completely hidden in binary format.
/// CNativeConfig is embedded in SDKCore.xcframework and also available as source product.

let package = Package(
    name: "EkycNativeIOS",
    defaultLocalization: "vi",
    platforms: [.iOS(.v14)],
    products: [
        // CNativeConfig - Exposed as product so binary frameworks can resolve the dependency
        // Also embedded in SDKCore.xcframework for direct access
        .library(name: "CNativeConfig", targets: ["CNativeConfig"]),
        .library(name: "SDKCore", targets: ["SDKCore"]),
        .library(name: "Ocr", targets: ["Ocr"]),
        .library(name: "Nfc", targets: ["Nfc"]),
        .library(name: "Liveness", targets: ["Liveness"]),
        .library(name: "FaceService", targets: ["FaceService"]),
        .library(name: "C06", targets: ["C06"]),
        .library(name: "QRCode", targets: ["QRCode"]),
        .library(name: "SDKCoreCamera", targets: ["SDKCoreCamera"]),
        .library(name: "SDKUI", targets: ["SDKUI"]),
        .library(name: "EkycUI", targets: ["EkycUI"]),
        .library(name: "Ekyc", targets: ["Ekyc"]),
        .library(name: "OpenSSL", targets: ["OpenSSL"]),
    ],
    dependencies: [],
    targets: [
        // CNativeConfig - C module required by SDKCore binary framework
        // Exposed as product so binary frameworks can resolve the module dependency
        // Also embedded in SDKCore.xcframework/Modules/CNativeConfig.swiftmodule/
        .target(
            name: "CNativeConfig",
            dependencies: [],
            path: "Sources/CNativeConfig",
            publicHeadersPath: "include"
        ),
        
        // SDKCore binary framework - exposed directly as product
        // CNativeConfig is embedded in SDKCore.xcframework/Modules/CNativeConfig.swiftmodule/
        .binaryTarget(name: "SDKCore", path: "Frameworks/SDKCore.xcframework"),
        
        // Binary frameworks
        .binaryTarget(name: "OpenSSL", path: "Frameworks/OpenSSL.xcframework"),
        .binaryTarget(name: "Ocr", path: "Frameworks/Ocr.xcframework"),
        .binaryTarget(name: "Nfc", path: "Frameworks/Nfc.xcframework"),
        .binaryTarget(name: "Liveness", path: "Frameworks/Liveness.xcframework"),
        .binaryTarget(name: "FaceService", path: "Frameworks/FaceService.xcframework"),
        .binaryTarget(name: "C06", path: "Frameworks/C06.xcframework"),
        .binaryTarget(name: "QRCode", path: "Frameworks/QRCode.xcframework"),
        .binaryTarget(name: "SDKCoreCamera", path: "Frameworks/SDKCoreCamera.xcframework"),
        .binaryTarget(name: "SDKUI", path: "Frameworks/SDKUI.xcframework"),
        .binaryTarget(name: "EkycUI", path: "Frameworks/EkycUI.xcframework"),
        .binaryTarget(name: "Ekyc", path: "Frameworks/Ekyc.xcframework"),
    ]
)
