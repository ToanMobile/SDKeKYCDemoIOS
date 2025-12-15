// swift-tools-version:5.9
import PackageDescription

let version = "1.0.30"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "7cec022249553cca9a6b7ad6e350a97e2490d9ecaa3438395b82e4ccefada9ed"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "9de05f6c289a31e1d3aa3ba2c8d4041f078fe69b58e944bf2fb0d2ce98eedf7d"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "c6b1ac286656695cdfbfe041487ba451d5cbd29d975887b9469c34b0da17267d"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "d37d79303b1e6167d716500d83d7eea0ec06ef293c23c595645283a40f7c322e"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "6010f82ada83f0a59ef834d666810b2b3d8045384026b6451f0e8d90940eba2d"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "dac1a36a1e71aa61162e78f378d363f9af2af9337ce3b414f90aaaf38e84fcd3"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "a0b4be21db3f74d1583e82c25ba6cd2d9e2c762be98edf0b3a70c8cba41348cf"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "2fde4ad222f3bcde34d285434c96fc85c4c78f08443d4f25c17f62b9c602c66c"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "7ca146ab055e9e8ba1cef60b0cdb5a0d3988995b849fd37bdbef37d2b611dae0"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "a4730fe5911addf0023686925a5df0cc5b1bcdaeaa3c9c86c82100633c8fc6d7"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "f7eb43e123a9727bc0be99ffe29ba1d8230db894853e9df5032a7279424b5f6a"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "731c91a30043e74637a940a5d6edc9f9dae6f09af8b63d08538db54c8278482b"),
    ]
)
