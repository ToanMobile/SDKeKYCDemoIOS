// swift-tools-version:5.9
import PackageDescription

let version = "1.0.32"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "7eb7cfc0b1a8b816b0a97a0a63d46f2ec8b69954bf34b0483f025b40fd798cfd"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "ae6989f37515b35b725053e25253733163b2d14233f685f858d9499722942cda"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "bf11a9e60227e1d1125aa952b469587c8938351bc374298f2f33fabbdf72ff10"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "732a5b112e982148ccc74a76cc57b67e057ac3581f5aed6f3989eb42e0d9d898"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "cd3d503bea58deea4ca119d8196546fd745b549a93b625a341f50b3637b684eb"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "e652d2ec405bb7d74c0ed08f286b0814dacad33dbf471fe2e0b3c5ffd103d45a"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "0dd3f2ef6da385b19fee52d6fd6c88577dba5f3e92feea3a1eb297f40c1cece9"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "d52cc988ac39dc6436151f2762d1ccc4667a1d4bd902716e38262eda2ddfde11"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "c77c7cff6c213d1b3d323047bc14c77357325e9160b775c6e5e3b85c3a2a88d3"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "e63a69780e2bf899579eff6010cd8a5687204c1916b9136a236146869b4dd134"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "cf1f6a2097ad004c8cbdca685d766ff50b08d78a0303aaf0e5279c2d47a84791"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "94dfa25adec7e6b7634fa9ec435852653fcf3234084630e5160dff4256cf9d42"),
    ]
)
