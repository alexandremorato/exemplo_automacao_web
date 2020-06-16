require 'selenium-webdriver'
require 'capybara/cucumber'
require 'cucumber'
require 'capybara'
require 'faker'
require 'site_prism'
require_relative 'pages_objects/page_objects'
require_relative 'helpers'

World(PageObjects)
World(Helpers)

Capybara.register_driver :selenium do |app|
  
  if ENV['BROWSER'].eql?('chrome')
    args = ['--start-maximized']
    caps = Selenium::WebDriver::Remote::Capabilities.chrome('goog:chromeOptions' => { 'args' => args })
    Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: caps)

    elsif ENV['BROWSER'].eql?('firefox')
     args = ['--start-maximized']
     caps = Selenium::WebDriver::Remote::Capabilities.firefox('moz:firefoxOptions' => { 'args' => args })
     Capybara::Selenium::Driver.new(app, browser: :firefox, desired_capabilities: caps)

    elsif ENV['BROWSER'].eql?('chrome_headless')
      args = ['--start-maximized', '--headless']
      caps = Selenium::WebDriver::Remote::Capabilities.chrome('goog:chromeOptions' => { 'args' => args })
      Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: caps)
      
    elsif ENV['BROWSER'].eql?('ci')
      args = ['--start-maximized']
      caps = Selenium::WebDriver::Remote::Capabilities.chrome
      Capybara::Selenium::Driver.new(app,
                                     browser: :remote,
                                     url: 'http://chrome:4444/wd/hub',
                                     desired_capabilities: caps)  
   end
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = "http://automationpractice.com"
end

Capybara.default_max_wait_time = 10