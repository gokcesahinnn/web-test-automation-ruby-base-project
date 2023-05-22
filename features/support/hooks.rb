Before do |scenario|
  Allure.add_attachment(name: "logs", source: "#{"#{scenario.name} is started"}", type: Allure::ContentType::TXT, test_case: false )
  Logger.new(STDOUT).info("#{scenario.name} is started")
  Global.reset_global
  Driver.get_driver
  page.driver.browser.manage.window.maximize
  $scenario_name = scenario.name
end

After do |scenario|
  begin
    scenario_name = scenario.name.gsub(/[^A-Za-z0-9 ]/, "").gsub(/\s+/, "_")
    if scenario.failed?
      puts "FAILED ==> Feature: #{scenario.feature.name} => Scenario: #{scenario_name}"
    else
      puts "PASSED ==> #{scenario_name}"
    end
    Capybara.current_session.driver.quit
  rescue Exception => exception
    puts "FAILED ==> #{exception}"
    Capybara.current_session.driver.quit
  end
end

