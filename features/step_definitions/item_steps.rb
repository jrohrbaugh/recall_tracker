Given(/^I\'m logged in as a parent$/) do
end

class RecallApi
  def self.recall(name)
    @recalled_names ||= {}
    @recalled_names[name] = true
  end

  def self.is_recalled?(name)
    @recalled_names && @recalled_names[name]
  end
end 

Given /^the item "([^\"]+)" has (not )?been recalled$/ do |item_name, not_txt|
  RecallApi.recall(item_name) unless not_txt
end

When /^I add an item named "([^\"]+)"$/ do |item_name|
  visit(root_path)
  click_link("New Item")
  fill_in("Name", with: item_name)
  click_button("Create Item")

  @item = Item.find_by_name(item_name)
end

When /^I view my list of items$/ do
  visit(items_path)
end

Then /^I should (not )?see an alert$/ do |not_txt|
  expected_content = /alert/i
  if (not_txt)
    assert !page.has_content?(expected_content)
  else
    assert page.has_content?(expected_content)
  end
end

When /^I have (\d+) items$/ do |num|
end

Then /^I should have (\d+) items$/ do |num|
end

When /^I remove the first item$/ do
end