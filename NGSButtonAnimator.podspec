#
# Be sure to run `pod lib lint NGSButtonAnimator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "NGSButtonAnimator"
  s.version          = "0.1.0"
  s.summary          = "Animate button to spinner and vice versa"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "Animate button to spinner and vice versa."

  s.homepage         = "https://github.com/PauliusVindzigelskis/NGSButtonAnimator"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Paulius Vindzigelskis" => "info@newguystudio.com" }
  s.source           = { :git => "https://github.com/PauliusVindzigelskis/NGSButtonAnimator.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Classes/*.{h,m}'

  s.frameworks = 'UIKit'
  s.dependency 'Masonry', '~> 0.6.4'
  s.dependency 'Shapes', '~> 1.0.2'
end
