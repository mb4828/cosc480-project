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

Then(/^I should see "(.*?)" above|before "(.*?)"$/) do |earlier_content, later_content|
    earlier_content.text.should appear_before(later_content.text)
end

When(/^I press "(.*?)" for "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

