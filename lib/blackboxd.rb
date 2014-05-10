Given /I click_on "(.*)" "(.*)"/ do |value, type|
  steps %Q{
    * I wait until "#{value}" "#{type}" renders
  }
  @driver.find_element(type.to_sym => value).click
end

When /I wait until "(.*)" "(.*)" renders/ do |value, type|
  if value == "preferences-command" || value == "ui-inline-del" then
    sleep 2
  end
  start_time = Time.now.to_i
  wait = Selenium::WebDriver::Wait.new(:timeout => @time)
  wait.until {
    element = @driver.find_element(type.to_sym => value )
    element if element.displayed?
  }
  end_time = Time.now.to_i - start_time
  puts (end_time.to_s + " seconds to render " + "<" + type + ">" + value.inspect + "</" + type + ">")
end

Given /I xpath "(.*)" "(.*)"/ do |what, how|
  steps %Q{
    * I wait for "#{what}" "#{how}" to render
  }
  @driver.find_element(:xpath, ".//" + how + "[text()='" + what + "']").click
end

When /I wait for "(.*)" "(.*)" to render/ do |what, how|
if what == "Insight" then
  puts sleep 2
end
  start_time = Time.now.to_i
  wait = Selenium::WebDriver::Wait.new(:timeout => @time)
  wait.until {
    element = @driver.find_element(:xpath, ".//" + how + "[text()='" + what + "']")
    element if element.displayed?
  }
  end_time = Time.now.to_i - start_time
  if end_time == 1 
    puts (end_time.to_s + " second to render " + "<" + how + ">" + what.inspect + "</" + how + ">")
  else 
    puts (end_time.to_s + " seconds to render " + "<" + how + ">" + what.inspect + "</" + how + ">")
  end
end

Given /I fill in "(.*)" with "(.*)"/ do |how, what|
  if (@driver.all(:id, how).count >= 1 ) then
    @driver.find_element(:id, how).send_keys(what)
  elsif (@driver.all(:class, how).count >=1) then
    @driver.find_element(:class, how).clear
    @driver.find_element(:class, how).send_keys(what)
  elsif (@driver.all(:name, how).count >=1) then
    @driver.find_element(:name, how).clear
    @driver.find_element(:name, how).send_keys(what)
  end
end

Given /I should (NOT )?see "(.*)"/ do |visibility, what|
  sleep 2
  what = what.to_s.strip
  if (visibility.to_s.strip == 'NOT') then
    result = @driver.all(:xpath, "//*[text()='" + what + "']")
    result.count.should == 0
  else
    start_time = Time.now.to_i
    wait = Selenium::WebDriver::Wait.new(:timeout => @time)
    wait.until {
      result = @driver.first(:xpath, "//*[text()='" + what + "']")
      result.displayed?
    }
    end_time = Time.now.to_i - start_time
    puts (end_time.to_s + " seconds to render => " + "#{result.text}" )
  end
end

Given /I wait "(.*)"/ do |seconds|
 sleep seconds.to_i
end

Given /I should (NOT )?be on "(.*)"/ do |visibility, value|
 sleep 3
 puts url = @driver.current_url.to_s
  if (visibility.to_s.strip == 'NOT') then
     url.should_not include value
  else
    url.should include value
  end
end

Given /I maximize browser/ do
  @driver.manage.window.maximize
end

Given /I refresh the page/ do
  @driver.execute_script("$(document).ready(function(){
    location.reload(true);
  });")
  sleep 4
end

Given /I mouseover "(.*)"/ do |value|
  sleep 3
  el = @driver.find_element(:class, value)
  @driver.action.move_to(el).perform
  sleep 2 
end

Given /I press the "(.*)" key/ do |value|
  @driver.action.send_keys(value.to_sym).perform
end

Given /I type in "(.*)"/ do |value|
  @driver.action.send_keys(value).perform
end

Given /I scroll down "(.*)" times/ do |number|
  number.to_i.times do
    @driver.execute_script("window.scrollBy(0,1000)", "")
  end
end

Given /I scroll up/ do
  @driver.execute_script("window.scrollTop", "")
end

Given /I display page source/ do
  puts @driver.page_source
end

Given /I accept alert/ do 
  alert = @driver.switch_to.alert
  alert.accept
end