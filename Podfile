# Uncomment the next line to define a global platform for your project
 platform :ios, '8.0'
source 'https://github.com/CocoaPods/Specs.git'

target 'SmartCranberryEditor' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SmartCranberryEditor
pod 'EDHFinder'
  pod 'EDHFontSelector'
  pod 'EDHInputAccessoryView'
#  pod 'Google-Mobile-Ads-SDK'
  pod 'Colours'
  pod 'FXForms'
  pod 'GHMarkdownParser'
  pod 'VTAcknowledgementsViewController'
  pod 'SwiftLint'

  pod 'Bootstrap', podspec: 'https://raw.githubusercontent.com/tnantoka/podspecs/master/Specs/Bootstrap/Bootstrap.podspec'
  pod 'Megrim', podspec: 'https://raw.githubusercontent.com/tnantoka/podspecs/master/Specs/Megrim/Megrim.podspec'
  pod 'github-markdown-css', podspec: 'https://raw.githubusercontent.com/tnantoka/podspecs/master/Specs/github-markdown-css/github-markdown-css.podspec'
end

post_install do |installer|
  require 'fileutils'
  FileUtils.cp_r('Pods/Target Support Files/Pods-SmartCranberryEditor/Pods-SmartCranberryEditor-acknowledgements.plist', 'SmartCranberryEditor/Assets/Pods-acknowledgements.plist')
end
