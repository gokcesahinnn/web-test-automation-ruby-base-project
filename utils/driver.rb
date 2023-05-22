class Driver

  def self.get_driver
    case BaseConfig.browser
    when 'chrome'
      options = Selenium::WebDriver::Chrome::Options.new
      add_default_values(options)
      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app,
                                       browser: :chrome,
                                       options: options)
      end

    when 'firefox'
      options = Selenium::WebDriver::Firefox::Options.new
      add_default_values(options)
      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app,
                                       browser: :firefox,
                                       options: options)
      end

    when 'remote-chrome'
      options = Selenium::WebDriver::Chrome::Options.new
      add_default_values(options)
      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app,
                                       browser: :chrome,
                                       url: BaseConfig.remote_url,
                                       options: options)
      end

    when 'remote-firefox'
      options = Selenium::WebDriver::Firefox::Options.new
      add_default_values(options)
      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app,
                                       browser: :remote,
                                       url: BaseConfig.remote_url,
                                       options: options)
      end
    end
  end

  def self.add_default_values(options)
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--ignore-certificate-errors')
    options.add_argument('--disable-notifications')
    add_headless_options(options) if BaseConfig.headless == 'true'
  end

  def self.add_headless_options(options)
    puts 'Execution is running headless mode!'
    options.add_argument('--no-sandbox')
    options.add_argument('--headless')
    options.add_argument('--window-size=1280,720')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--disable-gpu')
    options.add_argument('--test-type=browse')
    options.add_argument("--user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36");
  end

end
