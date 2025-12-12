// swift-tools-version:5.9
import PackageDescription

let version = "1.0.22"
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
        .binaryTarget(name: "SDKCore", url: "\(baseURL)/SDKCore.xcframework.zip", checksum: "43b42bb36d82f052396dc7f38bfb9d815e20b133f557543968a4a51c8f40ca8e"),
        .binaryTarget(name: "SDKCoreCamera", url: "\(baseURL)/SDKCoreCamera.xcframework.zip", checksum: "0bb0185e0d74de0d4ce963b0287da018cb9b6d39d775d397011be19d00b8c9ac"),
        .binaryTarget(name: "Ocr", url: "\(baseURL)/Ocr.xcframework.zip", checksum: "f0ad81eabab448df446b34f2669114c2b1509b5b1d6c978986399b629d870212"),
        .binaryTarget(name: "Liveness", url: "\(baseURL)/Liveness.xcframework.zip", checksum: "8d20ca75c15a82d708557c25bf81d391aed93005879d09b977ade0370164ed34"),
        .binaryTarget(name: "FaceService", url: "\(baseURL)/FaceService.xcframework.zip", checksum: "0331acd24cfe678488a1c0b928887a6da1d3b40b120b1ecb9c698f7158699f7b"),
        .binaryTarget(name: "C06", url: "\(baseURL)/C06.xcframework.zip", checksum: "b6c77b26aee8d067f1d30c65ba11bb90d500dec4d78ce974397fbe9fbb983dc7"),
        .binaryTarget(name: "QRCode", url: "\(baseURL)/QRCode.xcframework.zip", checksum: "3c91d0389b52bb4aff08defffe1d059fa39aa91b3ba56335f672360da77af889"),
        .binaryTarget(name: "Nfc", url: "\(baseURL)/Nfc.xcframework.zip", checksum: "624c60b788e25a5b02cb2834b3223e7dc70ab1f96066a8a79224e58014229f4c"),
        .binaryTarget(name: "SDKUI", url: "\(baseURL)/SDKUI.xcframework.zip", checksum: "06dae269f697c1ec85ccf98c813c71246e937de95ed29202b4a31cb55c546fad"),
        .binaryTarget(name: "EkycUI", url: "\(baseURL)/EkycUI.xcframework.zip", checksum: "452e2a5e9d8ac73301bd4815f980c129c1bcf5131dd96fef9476a8cc4eac1386"),
        .binaryTarget(name: "Ekyc", url: "\(baseURL)/Ekyc.xcframework.zip", checksum: "662fe611d177497e00a0655e85b00541b3fdf19156c2f3b6a161be53c2f40553"),
        .binaryTarget(name: "OpenSSL", url: "\(baseURL)/OpenSSL.xcframework.zip", checksum: "9fe67a1c728eefebaa8d093026cd097b4e6011c9d47a6cdcaf3f92b638012ae3"),
    ]
)
