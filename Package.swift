// swift-tools-version:5.9
import PackageDescription

let version = "1.0.13"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "1668bec6a11943931a44d094144a1e54605b841a429342c68404a243c5533bdd"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "52a17018010687d4497ac19bb346996c7cda82cc1b5082cfdb472dc64d47363d"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "ebbb49e12333032a8794af76773b862dbbc96e3d913b3e3ab8cf92dad74b6995"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "71587809b5f185b8f89fe68c523e177be831f87c51740cb3e337ed980a37b200"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "f71cdc68a37419a021af458b73623e329dc4d2abdadd9462c89a146de584325a"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "abb313af9cb29bf58791d46a63eb1fb30709b82370e09e0015d76ca5cd1097f8"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "3db3e5da1edc24e5951d3afb809a15764b7cd52b6752156327c5c3e24a4e388b"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "c64a6e306644ce6a10a5075d1373e552fe3a13e32ae837f938b8a6e1003d32dc"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "3654a5c31a805c963375cc94a1d10d8eb4142f59e39a416a4117a31ab3a3ea3d"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "b5888ed9a0eefc3d74b51b15205e6f35c8c57f93717d813bd78e613a9c59f8f0"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "e27c323429ce32d88e4d80a42d06ff5c68fe204ca842c6c104e1e2da35958ae2"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "2e3f79a2e65448bafc798ce1d92e808f2ebb3db97ef94ef3c2ccb1f55fe93ef8"),
    ]
)
