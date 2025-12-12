// swift-tools-version:5.9
import PackageDescription

let version = "1.0.23"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "a3d62fb5363d033d8a793f66b8fa2859389641188ade17c4ed839e54e3f353b0"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "c4e9e2d0b0473cbe3925295191f1596f0b522d5c11b346d67bbaa00caaaa5c54"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "e64d69fb353c24950824efebf9d03f64053a60db3d61304dda59040d37ea374a"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "2bb01142bf55199539df1cd18610dea8e69a89154122677717d6eea04bab40b4"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "5a0626ca4337b8bf683aa9836cff1f31d303004cedf6e97390a85321acf9e77d"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "37cbd433cea02c002dd5495254d983fce82136bc68aaa9575c32269fee868b20"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "6e8bb761e7ca1f1df740bd07ffcfc37e48c2044ece9ed8b1a1c15b24608fd16c"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "049427932d290cb25e2e6d13d276d6564e5e918ee176c17c80e52157d3b5087c"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "92f3d101e1e2dadbe3f5ce3ffa7cd961d38d020d2237fff6cf1f727ea705c3ee"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "ac9bb78c6ba06ec58c6d22a9154fbec9eddcb1e657e827caacca0c54c296a9f5"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "0ca1fd45aff9181c2b2a968421bd953996a9abcb459a21d259faee25ebdec617"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "c0bbf01c63ec44732740596123625591c6665cde211aca227c56a9075a83db0a"),
    ]
)
