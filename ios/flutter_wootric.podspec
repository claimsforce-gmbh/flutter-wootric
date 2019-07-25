#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_wootric'
  s.version          = '0.0.1'
  s.summary          = 'Wrapper around Wootric SDK.'
  s.description      = <<-DESC
Wrapper around Wootric SDK.
                       DESC
  s.homepage         = 'http://claimsforce.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'claimsforce GmbH' => 'kevin@claimsforce.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'WootricSDK', '0.13.0'

  s.ios.deployment_target = '8.0'
end

