// swift-tools-version:5.9
import PackageDescription

let version = "1.0.15"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "06d3701dcaa48e8bb71300bc72733cf1b1858441a6c2240b438df698d46cc247"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "49780c3a4304f9217ac61686f87ac585a5870d675cb4cf2d01b229c17fc2fcd4"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "31be482b6315f20135cc65550e852974cac530182966677bf74ac29b0f6145e6"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "ac5b4e1fd26ebb15be5ba1bf1864e30786468ceccc012aeb605e1dc7af3bdef9"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "8bcf1c8dc1e2d60d2b675f709f400d2b0e0ae4f19aaab973a9926049d903798a"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "7fe80df69053d6ba6cd3303edfb97c3a135427520fab99fd94a8b8407db5585b"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "af0be769f18a06f613e18ceead05a14ed66cd5e08a62a70c4fef00b006d5207c"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "d2884ccb402e80f02ce005e2a4c90703c52229b20147efc94c35933cae71d4c1"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "071fe9ab2349b58b3fa51d4bb1007677681a94cb6e95c75f7b2428501d788b5c"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "a16794dd6af022763cbeae3bdd3dec7ea13f71b300f673c053593635c0c6c5c9"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "9aaf3a1b98bbf569dcc8d370ef0b5e99d4929fe07a846802a5baf2b328bb8791"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "f47140bbd3f8188d116ad325bae1770d687666a47bc7641b5ce31df62b6b5b16"),
    ]
)
