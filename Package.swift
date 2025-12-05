// swift-tools-version:5.9
import PackageDescription

let version = "1.0.20"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "92996b6fe40d7caa5e302ed4c89907115fbf0a12301ddaee22134e3ef65249a9"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "640f10cd1ab15ec81199b04abf71b694eada03a4540b2dfb6158431f6b8105c7"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "0258296851b7134061a7c615c00fb8ed2418abb30dabd282c4d169161d54ca88"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "addc283337257b0edd567fc777b7f4b0cfebf370c0797d3b8a404c29062d263f"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "7d321c68cfe03f710351f56d301cacb67ff6d1d29c971c8357c4b41c3ed6b60e"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "7e1f9a6ad8d9ec1f41adaf7bc3695423233036ac8d45c77d6684f7547c84a40d"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "c74daec2f582a3237d0e8994cb7e99b44948a8fa7f2b73e38eb1225ce11886c4"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "8e9ea7df9daac770b5fbf78bb2a7eb81a22cb9b5a9be47be94ed430fce90ff96"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "b30ea2d526f179b6eda7b4d20321de2c227f0e64776c28fa8a8f9412a9a7c7c3"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "2856a27e8328572f4ad73a6f70e8bb6edd21cb8f2a58cedb108007f4402a2c11"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "ce2c522b22729f26b7e54b6309c6f1eeb8f8ad6697a47818567a3bc652dcbe98"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "ad06c65e5e90e52da3c5e6321f2773c88d35f14e5992cfc207f6453911706b59"),
    ]
)
