// swift-tools-version:5.9
import PackageDescription

let version = "1.0.17"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "ea1107a608b587ff6b89d4642dfdea4843feb5b1dbcf9760d9470abbd0324bdd"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "42a653d652fa6bbd987ec836f933ceaceeff4d57b2bf1933044bc89d71e35d53"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "f6d97dc2a3bf320ff696d44fb3712c38c0c9570fd67554116b2718a64fd8950e"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "0a9494ba0be68c52507f08758db343291bdceac913d637492740d1b85255fd82"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "6227326b4d71da2753218ef2c33a1840f4cb56b98b51fa4be1aceaf634fc83d3"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "35ef17a8c617bb564d826e0e88f7912cadf99217ab11c68a936a188362dbbf62"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "4e1a5fa81c318a3f7dc8e56d5e8353d0af2d9023aabedb171e6b7258fd05264f"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "21ec19f99147c93ff84e4b0d85871761304dc0d4b1e7506d6bbe1c831590a41c"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "01175074c86f8ee962d2ce32ef100601522899158b406a0a992e478dd870ed64"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "e1cb3fff9cee12c737de42a45326215a8a405c6430506c87dc333eb52b8fd2f8"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "8d3d67db87e83c2e74434589fff19abb1d2e9a4fb53cd1ae187e0903fbb30137"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "26ec976748f5974a5f6382fc3e922c38d91ff4ac51c4461f00d57cba9b12377b"),
    ]
)
