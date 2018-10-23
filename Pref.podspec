#
# Be sure to run `pod lib lint Pref.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Pref'
  s.version          = '0.1.4'
  s.summary          = 'Easily store Pojo Codable objects in User Defaults'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Easily store Pojo Codable objects in UserDefaults, without writing extra code
                       DESC

  s.homepage         = 'https://github.com/pikaboo/Pref'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'pikaboo' => 'lenabru@gmail.com' }
  s.source           = { :git => 'https://github.com/pikaboo/Pref.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Pref/Classes/**/*'
  s.swift_version = '4.2'

  
  # s.resource_bundles = {
  #   'Pref' => ['Pref/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
