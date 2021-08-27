require 'capybara'
require 'capybara/cucumber'
require 'pry'
require 'selenium-webdriver'
require 'site_prism'
require 'yaml'

World(PageTrivia)

BROWSER = ENV['BROWSER']
URL = 'https://opentdb.com'.freeze
DATA_MANAGER = YAML.load_file("#{File.dirname(__FILE__)}/support/massas/massas_dados.yml")

Capybara.register_driver :site_prism do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
    args: %w[
      --ignore-certificate-errors
      --disable-popup-blocking
      --disable-gpu
      --disable-translate
      --incognito
      --no-sandbox
      --acceptInsecureCerts=true
      --disable-impl-side-painting
      --debug_level=3
    ])
  if BROWSER == 'chrome_headless'
    options.args.merge([
      "--headless",
      "--disable-dev-shm-usage",
    ])
  end
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.configure do |config|
  config.default_driver = :site_prism
  config.app_host = URL
end

Capybara.default_max_wait_time = 20