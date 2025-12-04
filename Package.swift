// swift-tools-version:5.9
import PackageDescription

let version = "1.0.9"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "60bc4fa1610f3adf324c3fb7f87c3538a404238f63e7a7569805e7ce3dd534e4"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "60bc4fa1610f3adf324c3fb7f87c3538a404238f63e7a7569805e7ce3dd534e4CAMERA"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "8eda4da131bc5e43e99c939829fb07ed0c74a345b69c5143619732b8268718c6"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "b97eacd511bf5181d3ac4624d280deabffa5894dddfdfdd97c8f96eff7aa30ce"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "97f398f6b2741328fc98caa06a08428ed52ef44a781555f1d25611de6e7805da"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "ce5219515725e669b5aae4367f4381f261817425012075a19fda91c63dc75cd6"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "4b02575b7338d0b28e1f0fd73d28790a8dd4a7dab3a7f900c373980728b6ded0"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "27f9e0324b8ddd6f32ec1f7db02f1ea154e3470e67bb66749bb356c170aeace1"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "f0875ba2680e648fc155135e5020f98c01cadf31d6f7109993d2f0746dfe34d9"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "6d105eed6a09b95c0e61978069fc38a023bf0d36a7516cb6b2277cb2412bc6b7"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "5227fdb1a8066dde3697d81a7c7887b1cc5f28b6b76e3286161d30cf38414854"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "9bb93aba6658760023b73217f3422d725abaf2b319fd9ab24fac4916584892a4"),
    ]
)
