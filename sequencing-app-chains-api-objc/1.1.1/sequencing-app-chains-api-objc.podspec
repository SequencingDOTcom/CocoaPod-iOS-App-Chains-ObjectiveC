#
#  Be sure to run `pod spec lint sequencing-app-chains-api-objc.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "sequencing-app-chains-api-objc"
  s.version      = "1.1.1"
  s.summary      = "App Chains are the easy way to code Real Time Personalization (RTP) into your app. Module for iOS apps in ObjectiveC"
  s.homepage     = "https://github.com/SequencingDOTcom/CocoaPod-iOS-App-Chains-ObjectiveC"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Sequencing" => "gittaca@sequencing.com" }
  s.source       = { 
  :git => "https://github.com/SequencingDOTcom/CocoaPod-iOS-App-Chains-ObjectiveC.git", 
  :tag => "1.1.1" 
  }
  s.platform     = :ios, '8.0'
  s.source_files = 'Pod', 'Pod/**/*.*'  
  s.requires_arc = true
  
  
end
