# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MonthlyDelivery' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MonthlyDelivery
pod 'Alamofire', '~> 4.7'
pod 'SwiftyJSON', '~> 4.0'
pod 'IQKeyboardManagerSwift'
pod 'SVProgressHUD'

swift4 = ['IQKeyboardManagerSwift']

post_install do |installer|
    installer.pods_project.targets.each do |target|
        swift_version = nil
        
        if swift4.include?(target.name)
            swift_version = '4.0'
            else
            swift_version = '3.2'
        end
        
        if swift_version
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = swift_version
            end
        end
    end
end



end
