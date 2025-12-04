// swift-tools-version:5.9
import PackageDescription

let version = "1.0.12"
let baseURL = "https://github.com/ToanMobile/SDKeKYCDemoIOS/releases/download/\(version)"

let package = Package(
    name: "EkycSDK",
    platforms: [.iOS(.v14)],
    products: [
        // Main product - includes all frameworks
        .library(
            name: "EkycSDK",
            targets: [
                "SDKCore", "SDKCoreCamera", "Ocr", "Liveness",
                "FaceService", "C06", "QRCode", "Nfc",
                "SDKUI", "EkycUI", "Ekyc", "OpenSSL"
            ]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "CHECKSUM_SDKCORE"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "CHECKSUM_SDKCORECAMERA"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "CHECKSUM_OCR"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "CHECKSUM_LIVENESS"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "CHECKSUM_FACESERVICE"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "CHECKSUM_C06"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "CHECKSUM_QRCODE"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "CHECKSUM_NFC"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "CHECKSUM_SDKUI"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "CHECKSUM_EKYCUI"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "CHECKSUM_EKYC"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "CHECKSUM_OPENSSL"),
    ]
)
