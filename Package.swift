// swift-tools-version:5.9
import PackageDescription

let version = "1.0.11"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "732fbef09ce60b5fd96686b45516835c9750763c3588e8a3aebf8779aa767fd2"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "732fbef09ce60b5fd96686b45516835c9750763c3588e8a3aebf8779aa767fd2CAMERA"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "aa97b23b2b0602edf18bdd4914c668261d5ffc7074549f86207addeeb88313f4"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "c18164c34db4c27ca3f11c35a42f4dd3bf442b1e4f93c16b8e9b42b0cf18d50c"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "5678b3f77c64e689f9785d1da98aec912637da8c2d7f77f73ac83095f932b200"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "9c0ed91f445e89e202242425cf730edcdd1e3f48720d3cbda3c094873f56c852"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "9ff81378d3e032444061945e5d027425ffe198ab63e93245f5d1e7970eafbb41"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "ce0e6248aa988792b1f5535620e3f4849a43a2b8a7fea5b72fb6416ac093fc29"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "1e5f387bcea2d45ec88fa16e830e4281f9f068e9e1a6f8525e24d1d775add7c5"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "89eb4e0472b985f8bd34f36ff335719e24e0290720b18bb56856c261b0168d58"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "1b132c9aa3736e39c864db41267777e08385319a24611cae6f9dbbb61a571de2"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "eb7531e6fee4b3cddaf477307f2ea581c0691c1b1a93e910f7e73392b74ed7ab"),
    ]
)
