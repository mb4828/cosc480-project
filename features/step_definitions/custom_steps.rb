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

