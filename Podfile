# Uncomment the next line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!
inhibit_all_warnings!

target 'Instaco' do
  pod 'Alamofire', '~> 4.7'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'ObjectMapper', '~> 3.3'
  pod 'IGListKit', :git => 'https://github.com/Instagram/IGListKit.git', :branch => 'master'
  pod 'SDWebImage', '~> 4.0'
  pod 'KeychainAccess'
  pod 'StyledTextKit'
  pod 'ActiveLabel'
  pod 'SnapKit', '~> 4.0.0'
  pod 'SwiftLint'
  pod "Player", "~> 0.8.0"

  target 'InstacoTests' do
    inherit! :search_paths
    pod 'SwiftyJSON', '~> 4.0'
  end

end


post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
  end
 end
end

#post_install do |installer|
#    installer.aggregate_targets.each do |target|
#        installer.pods_project.targets.each do |target|
#            target.build_configurations.each do |config|
#                config.build_settings['SWIFT_VERSION'] = '4.0'
#            end
#        end
#    end
#end
