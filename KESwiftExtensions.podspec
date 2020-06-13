#
# Be sure to run `pod lib lint KESwiftExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KESwiftExtensions'
  s.version          = '0.1.0'
  s.summary          = 'A collection of convenient extensions to some Swift classes.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
"KESwiftExtension is a convenient collection of extensions to some Swift classes"
                       DESC

  s.homepage         = 'https://github.com/KaisEbraheem/KESwiftExtensions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'KaisEbraheem' => 'kebraheem@gmail.com' }
  s.source           = { :git => 'https://github.com/KaisEbraheem/KESwiftExtensions.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'KESwiftExtensions/Classes/*.swift'
  
  # s.resource_bundles = {
  #   'KESwiftExtensions' => ['KESwiftExtensions/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
