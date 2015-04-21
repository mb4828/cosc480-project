require "rspec/matchers"
require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

# via launchware.com
RSpec::Matchers.define :appear_before do |later_content|
  match do |earlier_content|
    page.body.index(earlier_content) < page.body.index(later_content)
  end
end

def handle_js_confirm(accept=true)
  page.evaluate_script "window.original_confirm_function = window.confirm"
  page.evaluate_script "window.confirm = function(msg) { return #{!!accept}; }"
  yield
ensure
  page.evaluate_script "window.confirm = window.original_confirm_function"
end

Then(/^I should see "(.+)" (above|before) "(.+)"$/) do |earlier_content, descriptor, later_content|
    earlier_content.should appear_before(later_content)
end

When(/^I press "(.*?)" for "(.*?)"$/) do |button_name, source_text|
    within(:xpath, ".//h4/text()[contains(.,\"#{source_text}\")]/../..") do
        click_link(button_name)
    end
end

Then(/^I shouldn't be able to access the edit schedule page for schedule (\d+)$/) do |sid|
  pending # express the regexp above with the code you wish you had
end

When(/^I accept the alert$/) do
    handle_js_confirm()
end


