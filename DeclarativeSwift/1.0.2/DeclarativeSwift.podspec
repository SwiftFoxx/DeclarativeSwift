Pod::Spec.new do |s|
  s.name             = 'DeclarativeSwift'
  s.version          = '1.0.2'
  s.summary          = 'Enhanced Swift experience by making the syntax as declarative as SwiftUI'
  s.homepage         = 'https://github.com/SwiftFoxx/DeclarativeSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'SwiftFoxx'
  s.source           = { :git => 'https://github.com/SwiftFoxx/DeclarativeSwift.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/DeclarativeSwift/**/*'
end
