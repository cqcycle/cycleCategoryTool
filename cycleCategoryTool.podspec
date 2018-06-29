#
# Be sure to run `pod lib lint cycleCategoryTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'cycleCategoryTool'
  s.version          = '1.0.0'
  s.summary          = 'A short description of cycleCategoryTool.'
  s.homepage         = 'https://github.com/cqcycle/cycleCategoryTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'cqcycle' => '15696564260@163.com' }
  s.source           = { :git => 'https://github.com/cqcycle/cycleCategoryTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'cycleCategoryTool/Classes/**/*'
  
  # s.resource_bundles = {
  #   'cycleCategoryTool' => ['cycleCategoryTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
