Pod::Spec.new do |spec|
  spec.name         = 'FluentYogaKit'
  spec.version      = '1.5.0'
  spec.license      = { :type => 'Apache License 2.0' }
  spec.homepage     = 'https://github.com/thanhtrdang/FluentYogaKit'
  spec.authors      = { 'Thanh Dang' => 'thanhtrdang@gmail.com' }
  spec.summary      = 'Fluent layout API for YogaKit'
  spec.source       = { :git => 'https://github.com/thanhtrdang/FluentYogaKit.git', :tag => spec.version.to_s }

  spec.ios.deployment_target = '8.0'

  spec.source_files = 'Source/*.swift'
  spec.dependency 'Yoga', '~> 1.5.0'

end