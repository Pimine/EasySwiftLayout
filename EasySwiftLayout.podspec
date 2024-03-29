Pod::Spec.new do |s|
  s.name 		= 'EasySwiftLayout'
  s.version 		= '1.6.3'
  s.license 		= 'MIT'
  s.summary 		= 'Lightweight Swift framework for Auto-Layout. Helps you write readable and compact UI code using simple API.'
  s.homepage 		= 'https://github.com/denandreychuk/EasySwiftLayout'
  s.authors 		= { 'Den Andreychuk' => 'denis.andrei4uk@gmail.com' }
  s.social_media_url 	= 'https://www.instagram.com/den.andreychuk'
  s.source 		= { :git => 'https://github.com/denandreychuk/EasySwiftLayout.git', :tag => s.version.to_s }

  s.source_files = 'Sources/*.swift'
  s.swift_version = '5.0'
  s.platform = :ios, "9.0"
end
