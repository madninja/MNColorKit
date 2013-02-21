Pod::Spec.new do |s|
  s.name     = 'MNColorKit'
  s.version  = '1.0.0'
  s.license  = 'BSD'
  s.summary  = 'A utility belt of color related add-ons for UIKit.'
  s.homepage = 'https://github.com/madninja/MNColorKit'
  s.author   = { 
    'Marc Nijdam'    => 'marc@imadjine.com' 
  }
  s.source   = { 
    :git => 'https://github.com/madninja/MNColorKit.git', 
    :tag => s.version.to_s
  }

  s.platform = :ios, '5.0'
  s.source_files = 'MNColorKit/'

  s.subspec 'RGBX' do |rgbx|
    rgbx.source_files = 'MNColorKit/RGBX.h'
    rgbx.framework    = 'UIKit'
  end

  s.subspec 'ImageColor' do |images|
    images.source_files = 'MNColorKit/UIView+MNColorKitImages.{hm}'
    images.framework    = 'UIKit'
  end

  s.subspec 'Controls' do |images|
    images.source_files = 'MNColorKit/MNColoredButton.{hm}'
    images.framework    = 'QuartzCore'
  end

end
