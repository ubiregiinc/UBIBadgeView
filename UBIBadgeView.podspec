Pod::Spec.new do |s|
  s.name          = 'UBIBadgeView'
  s.version       = '0.0.4'
  s.summary       = 'Badge UI for iOS'
  s.homepage      = 'https://github.com/ubiregiinc/UBIBadgeView'
  s.license       = { :type => 'MIT' }
  s.author        = { 'Yuki Yasoshima' => 'yasoshima@ubiregi.com' }
  s.platform      = :ios, '8.0'
  s.requires_arc  = true
  s.source        = { :git => 'https://github.com/ubiregiinc/UBIBadgeView.git', :tag => s.version.to_s }
  s.source_files  = 'UBIBadgeView/*.swift'
  s.swift_version = '5.0'
end
