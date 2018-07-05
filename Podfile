# Uncomment the next line to define a global platform for your project
 platform :ios, '9.0'

target 'SunAndSet' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SunAndSet
 pod 'SkyFloatingLabelTextField', '~> 3.0'
pod 'DropDown'
pod 'Kingfisher'
pod 'IQKeyboardManagerSwift'
pod 'DLRadioButton', '~> 1.4'
pod 'LGButton'
pod 'SDWebImage'
    pod 'SwiftyJSON'
pod 'GoogleMaps'
  pod 'GooglePlaces'
pod "ImageSlideshow/SDWebImage"
pod 'ImageSlideshow'
  pod 'Alamofire'
  end
  post_install do |installer|
      installer.pods_project.build_configurations.each do |config|
          config.build_settings.delete('CODE_SIGNING_ALLOWED')
          config.build_settings.delete('CODE_SIGNING_REQUIRED')
end
      end
