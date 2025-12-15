// swift-tools-version:5.9
import PackageDescription

let version = "1.0.31"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "ca5b40a42b0e683a9c47c41189d44aade2c4a455dbb2cd237ca9500c8e6fc1d3"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "cf4bba4dabba655d965b6754b1d6da0eaa675066673e669181abb753e29bca81"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "b3d2d8cffebb9c6c2af38658e3d107bb3355c17003873694a799e4bac21b63b3"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "cee82f391c0775a0180613526ce07d763261f42f06b4ae4ffccf2bb1bb5cdf49"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "e4118ef086209693caeba1d111f4adc9ba76b4fcd18c992da2d8ea70c8a0bfbe"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "f9c3817848eb90abd5ece291e8726911d69a01fcce0fcf6991cbd7931eb54856"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "89d964fb200fddbd82385e5d11b74213a8a53c15915ab08ab37512feeff9ba41"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "cd2665013285cd100097928fb47160700b13e6dfa3b8355affbbabe9a14eddfe"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "e9672b4957c82b379a275cd005a6ea13f86dcf01bbc965f2032c290ce94c8351"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "194fcd8c13979596bf756964e1820e8fad41c22ddf73451cd1eb359c21616b39"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "e5518b02d645cdd8846b60b387b0a8d5ec3950e0fcf7dddcf2474ad888679afc"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "54187f2cdd215e80cdfb9e962f9c6294b4467f1adb042c39ce43506f6c7e4abb"),
    ]
)
