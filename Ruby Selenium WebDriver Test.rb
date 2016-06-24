#!/usr/bin/env ruby

require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get "http://www.build.com"

sleep 1

account = driver.find_element(:id, "account-dropdown")


element = driver.find_element(:id, "search_txt")
element.send_keys "French Doors"
element.submit

puts "Page title is #{driver.title}"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.title.downcase.start_with? "french doors" }

puts "Page title is #{driver.title}"
driver.quit


$end