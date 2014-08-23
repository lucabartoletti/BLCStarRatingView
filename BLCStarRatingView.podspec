#
# Be sure to run `pod lib lint BLCStarRatingView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BLCStarRatingView"
  s.version          = "1.1.0"
  s.summary          = "A star rating view for iOS"

  s.homepage         = "https://github.com/lucabartoletti/BLCStarRatingView"
  s.screenshots     = "https://raw.githubusercontent.com/lucabartoletti/BLCStarRatingView/master/README/screenshot.png"
  s.license          = 'MIT'
  s.author           = { "Luca Bartoletti" => "luca.bartoletti@gmail.com" }
  s.source           = { :git => "https://github.com/lucabartoletti/BLCStarRatingView.git", :tag => "1.1.0" }
  s.social_media_url = 'https://twitter.com/lucabartoletti'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'BLCStarRatingViewSample/BLCStarRatingView'
end
