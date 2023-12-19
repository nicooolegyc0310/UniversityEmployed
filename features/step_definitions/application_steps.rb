Given(/^the following user exists:$/) do |table|
    table.hashes.each do |user|
      User.create!(user)
    end
  end
  
Given(/^the following opportunities exist:$/) do |table|
    table.hashes.each do |opportunity|
      Opportunity.create!(opportunity)
    end
end
  
Given(/^the following applications exist for "([^"]*)":$/) do |email, table|
    user = User.find_by_email(email)
    table.hashes.each do |application|
      opportunity = Opportunity.find_by_title(application[:opportunity_title])
      Application.create!(opportunity: opportunity, user: user, status: application[:status])
    end
end
  
  
Then(/^I should see a list of my applications$/) do
    expect(page).to have_css('table#applications')
end
  
Then(/^I should see "([^"]*)" with status "([^"]*)"$/) do |opportunity_title, status|
    within('table#applications') do
      expect(page).to have_content(opportunity_title)
      expect(page).to have_content(status)
    end
end
  