
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

Then /I change the title to "(.*)"/ do |new_title|
  fill_in("Title", :with => new_title)
  click_button("Edit Research Opportunity")
end


Then /I click on "(.*)"/ do |op_title|
  click_button(op_title)
end

Then /I delete opportunity (.*)/ do |op_title|
  opportunity = Opportunity.find_by(title: op_title)
  opportunity.destroy
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit page_name
end

Given /I visit the details page for "(.*)"/ do |opportunity|
  opportunity_id = -1
  Opportunity.all.each do |search_opportunity|
    if search_opportunity.title == opportunity
      opportunity_id = search_opportunity.id
    end
  end
  visit "/opportunities/" + opportunity_id.to_s()
end

When ('I enter {string} as my Filter by Professor') do |professor_name|
  fill_in 'professor_name', with: professor_name
end

    
