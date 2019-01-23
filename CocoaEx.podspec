#
# Be sure to run `pod lib lint CocoaEx.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

  s.swift_version    = '4.2'

  s.name             = 'CocoaEx'
  s.version          = '0.1.0'
  s.summary          = 'A simple package of code for extensions on cocoa framework.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  To save time on development, here are some simple extensions for you to speed up you coding time. Simply import in anywhere in you codes and just use it.
                       DESC

  s.homepage         = 'https://github.com/nicholaslck/CocoaEx.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nicholas Lau' => 'nicholaslck@gmail.com' }
  s.source           = { :git => 'https://github.com/nicholaslck/CocoaEx.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CocoaEx/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CocoaEx' => ['CocoaEx/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
