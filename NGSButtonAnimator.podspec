#
# Be sure to run `pod lib lint NGSButtonAnimator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "NGSButtonAnimator"
  s.version          = "0.1.1"
  s.license          = 'MIT'
  s.summary          = "Animate button to spinner and vice versa" 
  s.description      = "Animate button to spinner and vice versa."

  s.homepage         = "https://github.com/PauliusVindzigelskis/NGSButtonAnimator"
  s.author           = { "Paulius Vindzigelskis" => "info@newguystudio.com" }
  s.source           = { :git => "https://github.com/PauliusVindzigelskis/NGSButtonAnimator.git", :tag => "0.1.1" }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = "Pod"

  s.frameworks = 'Foundation', 'UIKit'
  s.dependency 'Masonry', '~> 0.6.4'
  s.dependency 'Shapes', '~> 1.0.2'
end
