Pod::Spec.new do |s|
  s.name             = 'TrackedValue'
  s.version          = '0.2.0'
  s.summary          = 'TrackedValue is a struct that determines whether a value has changed or not.'
  s.homepage         = 'https://github.com/konomae/TrackedValue'
  s.license          = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author           = { 'konomae' => 'konomae@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/konomae/TrackedValue.git', :tag => s.version.to_s }
  s.source_files = 'Sources/**/*.swift'
  s.swift_version    = '5.1'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = "2.0"
end
