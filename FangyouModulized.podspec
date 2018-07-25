#
# Be sure to run `pod lib lint FangyouModulized.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FangyouModulized'
  s.version          = '0.1.0'
  s.summary          = 'A short description of FangyouModulized.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/FY/FangyouModulized'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'FY' => 'terry_ash@163.com' }
  s.source           = { :git => 'https://github.com/FY/FangyouModulized.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.default_subspec = 'Fangyou'
  
  s.subspec 'Common' do |common|
      common.source_files = 'FangyouModulized/Common/**/*'
      common.dependency 'MJExtension', '3.0.13'
      common.dependency 'AFNetworking', '3.2.0'
      common.dependency 'ReactiveCocoa', '2.5'
  end
  
  s.subspec 'Estate' do |estate|
      estate.source_files = 'FangyouModulized/Estate/**/*'
      estate.dependency 'FangyouModulized/Common'
  end

    s.subspec 'Client' do |client|
    client.source_files = 'FangyouModulized/Client/**/*'
    client.dependency 'FangyouModulized/Common'
    end

    s.subspec 'Estate' do |estate|
    estate.source_files = 'FangyouModulized/Estate/**/*'
    estate.dependency 'FangyouModulized/Common'
    end

    s.subspec 'Fangyou' do |fangyou|
    fangyou.dependency 'FangyouModulized/Common'
    fangyou.dependency 'FangyouModulized/Client'
    fangyou.dependency 'FangyouModulized/Estate'
    end

  # s.resource_bundles = {
  #   'FangyouModulized' => ['FangyouModulized/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
