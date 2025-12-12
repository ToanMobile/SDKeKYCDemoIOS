// swift-tools-version:5.9
import PackageDescription

let version = "1.0.28"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "4f1196c5959ef3e2fc1542cf6c4c9e346146b0ac527891018bb370287f97c7e9"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "4bf068ca3dee0949de17f9238bec2199d6c75d9acf56ddb5be16cd15581f8fed"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "cf39edf48041352d3964f6ad0bf40bb9dc04c70e73f2c72993fb980c9b30acd6"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "43a55669b6df6a00be52e599bba01561b25860945ad151d2467b1ee78ab96aa0"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "1358f3fe6d8bf3ee30ca2c5a9992c84a14bfdeec4d084dd9ef11c485c54e2575"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "796e77b35cb0461c5fc0ae2d858908f8b1415f3492256d8e11498047fb588ebf"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "3711bb88c8ea4ccd2fe2e27b793ef8c74b94ffeccae5965b1d8dc7ab9c69e72a"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "c9634a468f58551357416b079d1ffba9d0e5d3421b53c874acc81def54946cd9"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "7489ae86b1096be0382e477c8ab8351c2690c33bf969501112040b53d7a6896d"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "52fabb8649cdc6b7e7f42d075c4208849d2c9f86074e5e5c713b5373d4418b90"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "5f5d13e6b2dc24ffb1efe2c29fadcea4ce20fdfc2eb91d2aa96ca06d5e5c41ec"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "2db807e3fde86772d665fecf5ad55864ee400668f38a3e18a916d58cd63dafb3"),
    ]
)
