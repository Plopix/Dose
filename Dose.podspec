Pod::Spec.new do |s|

  s.name         = "Dose"
  s.version      = "0.0.1"
  s.summary      = "Swift Dependency Injection Container"

  s.description  = <<-DESC
                    Swift Dependency Injection Container
                   DESC

  s.homepage     = "https://github.com/Plopix/Dose"
  s.requires_arc = true
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Morel Sébastien" => "morel.seb@gmail.com" }
  s.social_media_url   = "http://twitter.com/Plopix"
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/Plopix/Dose.git", :tag => "#{s.version}" }

  s.framework = "UIKit"
  s.source_files = "Dose/**/*.{swift}"
end
