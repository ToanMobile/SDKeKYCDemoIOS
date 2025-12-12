// swift-tools-version:5.9
import PackageDescription

let version = "1.0.24"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "fa33b90c4f7b7490ffd89103bdb38c6bf168ed23bc31395f3d66b9f2051d86da"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "ad37f5d799ece409da3c0de4fd8ef3bf4adf2eb307c195855c98130c764123ab"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "1c38cfd50952be66526d3067271589b8214d8f7f56820d8ab31e72f351b8b3a8"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "673c2326b506c4e7628279c6f6bc333218763ca5ce3afc83f7e6c6fb65490f17"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "cac9b2d9c8e154dd56f948c8bdff7f9f87983b13290971d22540b825ace2a511"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "eaf6473a559bb236b132d264c6bb8d6898ef22a61d685369af0cccd714ae9295"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "b020ac1b0a8c5f0547dd11136fc470f531f1087b8f8c301be7777c06260b03b4"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "a7b3fda1b559fc8d1be20c91ab666d7e8cb9611e6869cff2a6068dd72195a9c8"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "3807b7d9c0b8125079a8250febe92d0d35a8fed5fd822d586b8f9a822e59c79e"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "48b6a246085362e8cc758eae51059ef9d9fb1cf5f0de394b2b173e94879877ad"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "62aeeab5a72e628e980d0e647c211d8a14a7e926abf9b645a112b135173f7c43"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "1abaac8dfb5cbbc416c5f7794dc6c5476fa406bdb8c8096a2aa835e2bc9a9288"),
    ]
)
