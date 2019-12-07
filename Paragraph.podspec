Pod::Spec.new do |spec|
  spec.name = "Paragraph"
  spec.version = "0.0.1"
  spec.summary = "Syntax sugar for localization in iOS."
  spec.homepage = "https://github.com/magauran/Paragraph"
  spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.author = { "Alexey Salangin" => "alexey@salangin.com" }
  spec.ios.deployment_target = "11.0"
  spec.swift_version = '5.1'
  spec.source = { :git => "https://github.com/magauran/Paragraph.git", :tag => spec.version.to_s }
  spec.source_files  = "Sources/Paragraph/*.swift"
  spec.frameworks  = "Foundation"
end
