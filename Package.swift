// swift-tools-version:5.9
import PackageDescription

let version = "1.0.10"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "34d984be069069e6935c2f79d83f006c3da42a6dcac691d7f78ad827413edd18"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "34d984be069069e6935c2f79d83f006c3da42a6dcac691d7f78ad827413edd18CAMERA"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "ac500ed3c14813165181c99db3656fdb3602aa59ce8f5ae097d45981c4b56362"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "8997d159e9069b43e157d40695daa5dfaf2e60bea34bd736f960a3a18278fb80"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "004049532000fd39213f1ddf2ca7e964c161b2b72dc987c79408f72c029bc000"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "18ede096eabb5e9614c16694adbebc3fd052a496885b4579f7304182257eaf82"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "212ecac27af232090350ce25c20183b612f4bcdb7e4854bb814136b93cd9492b"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "b0ebefb6f6a215303a64aa4c2a550981cbb3dd6e971948debe9462ab0da980ec"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "f870f28d3797be091977112a0ad1092d9180a1b8b7c9e0f19a9d8822997b3a1d"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "7564037be695302f262666d8cb9b77f97e648b3433b661ae0191dcf86e781456"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "73f220bea73ee4c9f4cb2a8687ae58290f122b5569ea0505398cd0f174c0faff"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "c449c5f05dfc80c7d74fe17b5414a6584322d70bcb1f8fcf896f242a092e4878"),
    ]
)
