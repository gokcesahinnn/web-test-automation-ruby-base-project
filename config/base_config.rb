module BaseConfig

  @wait_time = 20
  def self.wait_time
    @wait_time
  end

  @short_wait_time = 5
  def self.short_wait_time
    @short_wait_time
  end

  @long_wait_time = 60
  def self.long_wait_time
    @long_wait_time
  end

  @browser = ENV['browser'] || 'chrome'
  #     Available options
  #       * chrome
  #       * firefox
  def self.browser
    @browser
  end

  @headless = ENV['headless'] || 'false'
  # Available options
  #   * 'false'
  #   * 'true'
  def self.headless
    @headless
  end

  @url = "https://www.google.com"
  def self.base_url
    @url
  end

end