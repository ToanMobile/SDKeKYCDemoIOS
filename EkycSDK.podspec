Pod::Spec.new do |s|
  s.name             = 'EkycSDK'
  s.version          = '1.0.8'
  s.summary          = 'eKYC iOS Native SDK - OCR, NFC, Liveness, Face Recognition'
  s.description      = <<-DESC
Native SDK for eKYC (Electronic Know Your Customer) with full OCR, NFC, Liveness, 
Face recognition and pre-built UI flow. iOS 26.1+ compatible.

IMPORTANT iOS 26.1+: After pod install, copy Podfile_snippet.rb to enable auto-fix.

NOTE: OpenSSL.xcframework is NOT included in this pod due to CocoaPods limitations.
If you need NFC functionality, add OpenSSL manually or use SwiftPM instead.
                       DESC
  s.homepage         = 'https://github.com/ToanMobile/SDKeKYCDemoIOS'
  s.license          = { :type => 'Proprietary', :text => 'Copyright © 2025 Van Toan. All rights reserved.' }
  s.author           = { 'Van Toan' => 'vantoan@example.com' }
  s.source           = { :git => 'git@github.com:ToanMobile/SDKeKYCDemoIOS.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'
  s.swift_version = '5.9'
  
  # Binary Frameworks
  # NOTE: OpenSSL.xcframework is excluded due to CocoaPods static/dynamic conflict
  # If you need NFC, add OpenSSL manually or use SwiftPM
  s.vendored_frameworks = [
    'Frameworks/SDKCore.xcframework',
    'Frameworks/SDKCoreCamera.xcframework',
    'Frameworks/Ocr.xcframework',
    'Frameworks/Liveness.xcframework',
    'Frameworks/FaceService.xcframework',
    'Frameworks/C06.xcframework',
    'Frameworks/QRCode.xcframework',
    'Frameworks/Nfc.xcframework',
    'Frameworks/SDKUI.xcframework',
    'Frameworks/EkycUI.xcframework',
    'Frameworks/Ekyc.xcframework'
  ]
  
  # Source files for CNativeConfig
  s.source_files = 'Sources/CNativeConfig/**/*.{h,c}'
  s.public_header_files = 'Sources/CNativeConfig/include/**/*.h'
  
  # Preserve helper script for iOS 26.1+ fix
  s.preserve_paths = 'install_fix.sh'
end
