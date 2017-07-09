Pod::Spec.new do |s|
  s.name             = "PMKCoreLocation"
  s.summary          = "PromiseKit Core Location Extension"
  s.version          = "4.2.0"
  s.homepage         = 'http://promisekit.org'
  s.license          = 'MIT'
  s.authors          = { 'Max Howell' => 'mxcl@me.com' }
  s.source           = {
    :git => "https://github.com/mxcl/PromiseKit.git",
    :tag => s.version.to_s
  }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  
  s.source_files = 'Sources/*'
  
  s.dependency 'PromiseKit/CorePromise'
  s.frameworks = 'CoreLocation'
end
