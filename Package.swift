// swift-tools-version:5.9
import PackageDescription

let version = "1.0.18"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "4f369f86165024a26fab2679c84801055d1f58049449fa8697b465ecb997ed1c"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "deed8468e282e8dd8af64b08b33f11dd1493990271a7fac2845ff41d16fb0380"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "ebd8a21aac22c6e9dc46c169bff27c65baa4308a847f7c4a0fe6ca8cb5e8f37a"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "85fff0b6097290c8a479c4835002926a66f7b5a7990cafdd23b081a1e7fb633a"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "a120d6befc911ee0e74cedb75d08dfa927d46e679d8db277f15ef46e9aedab18"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "b0d6418a535e6386692ae3a364d220a73a76480ebc67eb8d703043e745814a24"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "901e05ecde1b6cf4481afb595f7736a7f07a1253a81f5bcbeae464b81c13ca84"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "707fa07cd89ac688b776c9f486ed28b3600d04115dc680eab3eaab0637e2b34e"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "33e0b680d9fb3950f804d609050ea24a7b35b10e08d48ab21a894d201b47393a"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "8c45a836ca22b9f33ecf0c67cd1eabb54ebbec25406b4a33e0fffb697ceb1ac7"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "2284cc2be9a08b992fb8d96c51f32274f8a7c8cdedb3884f7ec8ca527eaa5dc2"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "9eb6d533035b5ed6a9fc75966e903edffc947233a597ed721bf3e9f832930f8a"),
    ]
)
