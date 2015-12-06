require 'selenium-webdriver'
require 'rspec'
require 'watir-webdriver'
require 'watir-webdriver/wait'
require 'yaml'
require 'rspec/expectations'
require 'cucumber'
require 'time'
require 'appium_lib'

class AppiumWorld

end

World do
	AppiumWorld.new
end

@@report_path = "html_reports"
FileUtils.rm Dir.glob(@@report_path + "/*")
$local_config= YAML.load_file('host_config/local_handset.yml')
$serverIP = $local_config["android"]['serverIP']
$port = $local_config["android"]['port']

Before do |scenario|
		opts = {
					"appium_lib" => {
							"server_url" => "http://#{$serverIP}:#{$port}/wd/hub"
					},
					"caps" => {
							"platformName" => $local_config["android"]['platformName'],
							"appActivity" => $local_config["android"]['appActivity'],
							'newCommandTimeout'=> 900,
							'noSign' => false,
							'enablePerformanceLogging'=> false,
							"appPackage" =>  $local_config["android"]['appPackage'],
							"deviceName" => $local_config["android"]['handset'],
							"app" => $local_config["android"]['app'],
							"fullReset" => false
					}
			}
			Appium::Driver.new(opts)
			Appium.promote_appium_methods AppiumWorld
			$driver.start_driver
end

def take_screenshot
	# Wait for everything to settle
	sleep 1
	prefix = "png"
	filename = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
	filenameJoin = (0...50).map { filename[rand(filename.length)] }.join
	filename = "#{@@report_path}/#{filenameJoin}.#{prefix}"
	screenshot filename
	Dir.chdir(File.dirname(filename))
	embed(File.basename(filename), "image/png")
	rootdir = File.expand_path("..",Dir.pwd)
	Dir.chdir rootdir
end


After do |scenario|
	take_screenshot
	$driver.driver_quit
end



