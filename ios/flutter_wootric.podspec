#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_wootric'
  s.version          = '0.1.3'
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
  s.dependency 'WootricSDK', '0.21.1'

  s.ios.deployment_target = '9.0'
end

