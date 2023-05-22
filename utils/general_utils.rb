class GeneralUtils

  def self.refresh_page
    page.evaluate_script('window.location.reload()')
  end

  def self.go_back_page
    page.evaluate_script('window.history.back()')
  end

  def self.scroll_to(element)
    script = <<-JS
      arguments[0].scrollIntoView(true);
    JS
    Capybara.current_session.driver.browser.execute_script(script, element.native)
  end

  # It allows to scroll down by pixels.
  # @param number (Integer)
  def self.scroll_down_by(number)
    Capybara.current_session.driver.browser.execute_script("window.scrollBy(0,#{number})")
  end

  def self.scroll_to_bottom
    page.execute_script('window.scrollTo(0, document.body.scrollHeight)')
  end

  def self.scroll_to_top
    page.execute_script('window.scrollTo(document.body.scrollHeight,0)')
  end

  def self.verify_attribute_with_value(locator, given, expected)
    value = find(locator)[given]
    expect(value).should eql?(expected)
  end

  def self.switch_to_last_window
    page.driver.browser.switch_to.window(page.driver.window_handles.last)
  end

  def self.switch_to_last_frame
    page.driver.browser.switch_to.frame
  end

  def self.switch_to_frame(locator_type, frame_locator)
    page.driver.browser.switch_to_frame(find(locator_type, frame_locator))
  end

  def self.switch_to_frame_default_content
    page.driver.browser.switch_to.default_content
  end

  def self.switch_to_first_window
    page.driver.browser.switch_to.window(page.driver.window_handles.first)
  end

  def self.wait_until_visible(locator_type, locator, wait: BaseConfig.wait_time)
    page.should have_selector(locator_type, locator, wait: wait, visible: true)
  end

  def self.wait_until_clickable(locator_type, locator)
    count = 5
    clickable = false
    while count.positive?
      begin
        find(locator_type, locator, wait: 2, obscured: false) ? true : raise
        count = 0
        clickable = true
      rescue StandardError
        count -= 1
      end
    end
    raise "Element not found locator: #{locator} " if count.zero? && !clickable
  end

  def self.encode_url url
    CGI.escape url
  end

  def self.body_setter(body, param, value)
    body[param.to_sym] = value
  end

  def take_screenshot(file_name)
    file_path = 'output/screenshots'
    screenshot = "#{file_path}/#{file_name}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, "image/png", "Click here to view screenshots")
  end

end