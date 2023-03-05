Pod::Spec.new do |spec|
  spec.name         = "SelectionSheetController"
  spec.version      = "1.0.0"
  spec.summary      = "This is the best SelectionSheetController Framework."
  spec.description  = "This is the best framework ever. It will help you to provide customize selection controller to your project"
  spec.homepage     = "https://github.com/akshayparth/SelectionSheetController"
  spec.license      = "MIT"
  spec.author             = { "Akshay Raiyani" => "akshay.raiyani@parth.com" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :git => "https://github.com/akshayparth/SelectionSheetController.git", :tag => spec.version.to_s }
  spec.source_files  = "SelectionSheetController/**/*.{swift,storyboard}"
  spec.swift_versions = "5.0"
  spec.framework  = "UIKit"
end
