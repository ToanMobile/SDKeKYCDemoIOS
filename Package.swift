// swift-tools-version:5.9
import PackageDescription

let version = "1.0.29"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "36c5c4a3ba5ee1f9344a8ea0eb7b5865fc22ac5dbea5289d921d138dad160743"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "f7b360f4455a0d4e97720249dd00d6309de22bc890b45b48bbc3e56255cc5fe2"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "5254a7128cbf9770c435a51c5cdd919e3710a9307c122cc265ff430c5bb739a9"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "a021a21de57181b142e14311d27356d169ef75a0a1a5f9411c1f9469bb5a8323"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "89e00277d483208429e183d2965506ac83f62094eac154d3b57e03b8575971c1"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "cbec0b710a8a1e84f87c96edc1ebbf54036fc348238ae265b603a3f92069e54a"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "a084475a69c712421be4340002ce9c7939502a87353608c22b39fee81b46eaa7"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "4bdee01201870565b873b325100163dbb6ae6c3ccc87cece8a10c0161c047e1a"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "11cfaf765fffe2aad0d9a4ce445148080a277d0d300d67e361811711b7ab988a"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "3608da6198c41404bc883b703a65820f956a15d41cb7ba6fb5ff02f2dcb0a1b8"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "ff047f52595b86aef4d1d7bbdbed69e74978db64b64707ea1445783794080129"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "e2b5a3d5939d65ed0b9cf89080ea65c9475ba5658f476f01ca6b654a060170c1"),
    ]
)
