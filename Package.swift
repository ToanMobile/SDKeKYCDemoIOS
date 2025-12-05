// swift-tools-version:5.9
import PackageDescription

let version = "1.0.21"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "592333a0a5b68dd67c02c8d24b1c24070b054025a9507343b34ba92c4dd3997b"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "adabdf2b5002394bdf7323d59af599f3c6bc37b67a3078839e9ffcd93d1eea89"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "3e9b3539f76ada5160946d4543f731cba29e81f0925fb2147fec55025cad9762"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "6c7bbf84739556f00a898e5a5af3f43de2ab1a7be55176a2efb3890aee88a7ce"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "e5f8b00de4e76f12ff353df39b5da82dfa80c7233d2f8bf57eb8ee87c1dfbcd8"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "3fe63a69e92f00b9da3ac1f790d1ffa8aa61637e106fc071cf5b9b201db2ab9e"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "1fdeb782f4d7bd1dbc400356e69b9af4e619edf2fc22701023fbab80c9c0d5b6"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "fb89c74214332cad45127d960ae2b20b24ff8b619fba49d67938cb6a72b7c3ee"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "e8c8376126965a4280de6acc30c38c17f39d8866c7dd87d051f237e9de94b697"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "e792cefe26cd4ac1576ccbaea47e0b965f4c85218d159dccfc7bfca944577bb7"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "ec758affe7a60150e977839ca365fb55bfad6929288c4502b491bbb4261600cf"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "cc532184d2f0630418c82a004f94f0ee6a8150a5cd55c22cc699114320eac7c6"),
    ]
)
