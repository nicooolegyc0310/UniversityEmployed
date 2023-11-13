
Given /the following opportunities exist/ do |opportunities_table|
  opportunities_table.hashes.each do |opportunities|
    Opportunity.create!(opportunities)
  end
end

Then /(.*) seed opportunities should exist/ do | n_seeds |
  expect(Opportunity.count).to eq n_seeds.to_i
end

Then /I add opportunity (.*)/ do |op_title|
  fill_in("Title", :with => op_title)
  fill_in("Capacity", with: 1)
  click_button("Create Research Opportunity")
end

Then /I delete opportunity (.*)/ do |op_title|
  opportunity = Opportunity.find_by(title: op_title)
  opportunity.destroy
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit page_name
end
