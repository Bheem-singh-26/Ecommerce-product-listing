# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'EcommerceDemo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  pod 'Alamofire’, '4.5.0'
  pod 'IQKeyboardManagerSwift', '4.0.10'
  pod 'RealmSwift'

  # Pods for EcommerceDemo
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['SWIFT_VERSION'] = '3.0'
          end
      end
  end


end
