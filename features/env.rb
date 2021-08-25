require 'capybara'
require 'capybara/cucumber'
require 'pry'
require 'selenium-webdriver'
require 'site_prism'
require 'yaml'

DATA_MANAGER = YAML.load_file("#{File.dirname(__FILE__)}/support/massas/massas_dados.yml")

Capybara.register_driver :site_prism do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
    args: %w[
      --window-size=1280,800
      --no-sandbox
      --incognito
      --disable-gpu
      --enable-logging
    ]
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

# DATA_MANAGER = YAML.load_file("#{File.dirname(__FILE__)}/support/massas/massas_dados.yml")
URL = 'https://opentdb.com'.freeze

Capybara.configure do |config|
  config.default_driver = :site_prism
  config.app_host = URL
end

Capybara.default_max_wait_time = 20
