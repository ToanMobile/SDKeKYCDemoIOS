// swift-tools-version:5.9
import PackageDescription

let version = "1.0.25"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "500b50825e64396dbdb773833d540fdde9630b22346a89042a2e9c26d53ac7b6"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "0d77448f486f4b5e34ead7b7769f4989665d79becd659bd0988c6daba25cbb3f"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "bba2fd34716b049b2f96d0d71d676215512c4c710f84e013a793b546d83bd483"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "b545a5db49f2a936cb024ea1ac118bcde07095e3799c1ec6b66328cf25606f2f"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "3c1b4042b07099091479648c7039fbbdda7c91457d977656b578ee5a344752a7"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "54cad8297af066a154e7ea4a652a88e872fd04fb5bf5399ebc959b52af8ba34c"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "77827a80af120f6eabd1fd03447d268b44649f4fef14c0ddc104b7c1fa2fe909"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "930fe5beed9d3dbc16ad11312368c3afe634fd076abd29383d5f3bac6f66a791"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "9c77c1d429d6d4d676dfff3a10798313d6c528357c62e0ac60927cfb45711b88"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "e85d4c050234ab2b42d0d7e7628a6d4b4cc694a7414fa12836d0ffffd668007c"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "db4145877ea7b6f8e735d29c32d84a034ae18643ddffb367526540908ef7972d"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "daf7a2af12806d5e9cd68efd395f07b2b3bdfb0a31b4302ae89ceb76a9a0ebed"),
    ]
)
