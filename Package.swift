// swift-tools-version:5.9
import PackageDescription

let version = "1.0.16"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "927ffac5ce8171dc98420aa991f63947b4eb6995fe9896c9882b69f5b8b64e50"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "642cd0a1f0f10ae619e4c5a66169408813975f81422bd6399e551e726aabe093"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "456ca959d8097f96191dd39f58fe7b1b746aa19c5721092ab725cf50809cebb6"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "3302061620be2d1a61770928da7ef125bbbfe81b384722977472d2d15be86a14"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "363b1dcb1fb4236d3aa4fd94fe485e569bee3b73a8a486cc3158c70557c467d0"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "cf0fac42ba07666fea76f1db19037e81a58d3a1b58358b7b603d12af3262e5f0"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "11c8ab0e0ab25c92c735505c862f786326da5025a251cdc76f21f428aeb6444f"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "8155672492354035cbb178bba48f0b51bfa6a5661a6f40979d513847d78379c7"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "85c10a35c0cf534ebaf0f64cbf7a7adaff8c970d9fd186706f50af3e50f0ce63"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "4ea1571cbe46fbcf45b883d4e947bc7c6913c95c3ba55755179e5004c88362cd"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "27fe1a367eae9fd885c58dea550c14b4c61140616d5cadbc01e2d16169d70c9c"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "715e5143ca3fd6e37c37e3b0f0a9d0360205cda928cb9363891f38aa21d90826"),
    ]
)
