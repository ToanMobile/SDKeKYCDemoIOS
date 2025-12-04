// swift-tools-version:5.9
import PackageDescription

let version = "1.0.19"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "24f315da217faf7d979ec5c1a36f89b080d252a9cf95d61d7dc0c09243000e50"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "17f12fe683d8116a939bc83117d3b6c2d4a0f7fd074f686a6cbd6649b32d82b2"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "24c943120dc62860aab2baee74316ddc41d4d42bbe36d5b7f1f301cda5ab4718"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "bf0ae7739884a890a83f4a4f6f0f0defccd95b74378f9396cab7ed11faf596ed"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "364fecc6df9bb8a9d0f0f716817694b15688f46bae5061f8969b2174bf4de63e"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "1b3d28efce46e02d6f93bc3deb84830a28a6e84fb18e1c51baf78d67eb81b2d3"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "faac0340c268c249a1417712bcf6350818b5d3f0522fc619e6d83d1db04aba3e"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "4b4fac7bf06da8b82b883332bb25fb6cde29b4e760affcfc0045b31feda6aa34"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "d491fa53c0ff228f6a88fcd33d2ad172c7aebac5e1623d34e6f67f15b2afb77c"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "049b87535c41b39e0dcf5f16cea7b1b86da746f150aff9d824bdd8dd7beedb9a"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "37e5deaf13d814b36d2187c305621c6b4545bdce41e5c50a17eb097ac8ca4e2f"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "949d9a4f2146f79de52261f00dc6c381bf3720749ec4dabc6eb754ede30cde2c"),
    ]
)
