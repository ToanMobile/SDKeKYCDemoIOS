// swift-tools-version:5.9
import PackageDescription

let version = "1.0.14"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "344a68ab2f6297e7c4faae4aa3d28bc27f5dabe167709eba1e17371551879ad2"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "a121777f70278659ccec502c26efa449175242a0a3f91d0d8a106195e339f312"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "0353e86d865303a47b2092c8bc6f2783785cb1ccb766d6524c7ce58e95da792f"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "763cf28be8821dd7afcb15c8d8ad58ee03bf5ad88244312dbe4b47ac4f2c4420"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "ce2b81fa7c542d4989e00a66b6025942f7ad7c671e21566ec914389dc6915651"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "b71a1c482fda9e8d25fe1072a892864d9f7fe523bb2157831b9763b9e297eb87"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "5c805ebadeca3dfaba8db5434aa0650f53842166b5dee6ce5ffa82593fcd6a74"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "089be1aa251b51f4a0f6500c31e1d1b46762e0ec6645eb1872d9fbb7b0a57f07"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "6213a4246af99b9cb668b33e7ebddcc53df0c43c736536e9dc84c77721409d99"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "508ecb5aa34f477c1c0bbcc6a11a829d94fc5271b8639e139d061c38c38a8380"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "c62092f2e50c78f9ba4ca6f334609fbb2c4b634786480fbf88b88adb7375c518"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "4f1b1ea974b71365b05ef8fb72b8861cc8698cdf6e5a92517d4bba23df0bbf4c"),
    ]
)
