require 'capybara'
require 'capybara/dsl'
require 'httparty'
require 'rspec'
require 'selenium-webdriver'
require 'date'
require 'time'
require 'allure-cucumber'
require 'json'
require 'jsonpath'
require 'logger'
require 'faker'

Dir["#{Dir.pwd}/config/**/*.rb"].each { |file| require_relative file }
Dir["#{Dir.pwd}/global/**/*.rb"].each { |file| require_relative file }
Dir["#{Dir.pwd}/utils/**/*.rb"].each { |file| require_relative file }

include Capybara::DSL
include RSpec::Matchers
RSpec.configure { |config| config.include Capybara::DSL, type: :feature }

Capybara.configure do |config|
  config.app_host = BaseConfig.base_url
  config.default_selector = :css
  config.default_max_wait_time = BaseConfig.wait_time
  config.default_driver = :selenium
  config.default_normalize_ws = true
end