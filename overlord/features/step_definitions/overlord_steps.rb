Given(/^The bomb is available$/) do
  visit "/"
end

When(/^The bomb is booted$/) do
  click_button('arm-button')
end

Then(/^The bomb should be activated$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^The bomb is activated$/) do
  visit "/activated"
end

When(/^The deactivation code is used$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^The bomb should be deactivated$/) do
  pending # express the regexp above with the code you wish you had
end
