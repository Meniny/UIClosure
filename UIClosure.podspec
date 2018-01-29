Pod::Spec.new do |s|
  s.name             = 'UIClosure'
  s.version          = '1.0.0'
  s.summary          = 'Time-saving closures for iOS UI elements written in Swift'

  s.homepage         = 'https://github.com/Meniny/UIClosure'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.authors          = { 'Elias Abel' => 'admin@meniny.cn' }
  s.source           = { :git => 'https://github.com/Meniny/UIClosure.git', :tag => s.version.to_s }
  s.social_media_url = 'https://meniny.cn'
  # s.screenshot       = ''

  s.swift_version    = "4.0"
  s.ios.deployment_target = '9.0'

  s.source_files     = "UIClosure/**/*.{swift}"

  s.framework        = 'Foundation', 'UIKit'
  s.module_name      = 'UIClosure'
end
