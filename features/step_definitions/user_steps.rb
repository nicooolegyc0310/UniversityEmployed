
Then /create a new student with "(.*)" email, "(.*)" password, "(.*)" firstname, and "(.*)" lastname/ do | email, pwd, firstname, lastname|
  visit "/signup"
  fill_in("First name", :with => firstname)
  fill_in("Last name", :with => lastname)
  fill_in("email", :with => email)
  fill_in("password", :with => pwd)
  choose("user_user_type_student")
  click_button("Create Account")
end

Then /create a new professor with "(.*)" email, "(.*)" password, "(.*)" firstname, and "(.*)" lastname/ do | email, pwd, firstname, lastname|
  visit "/signup"
  fill_in("First name", :with => firstname)
  fill_in("Last name", :with => lastname)
  fill_in("email", :with => email)
  fill_in("password", :with => pwd)
  choose("user_user_type_professor")
  click_button("Create Account")
end

Then /create a new grad student with "(.*)" email, "(.*)" password, "(.*)" firstname, and "(.*)" lastname/ do | email, pwd, firstname, lastname|
  visit "/signup"
  fill_in("First name", :with => firstname)
  fill_in("Last name", :with => lastname)
  fill_in("email", :with => email)
  fill_in("password", :with => pwd)
  choose("user_user_type_grad_student")
  click_button("Create Account")
end

Then /I log out/ do
  visit "/logout"
end

When /I try to log in with "(.*)" email and "(.*)" password/ do | email, pwd|
  visit "/login"
  fill_in("email", :with => email)
  fill_in("password", :with => pwd)
  click_button("Sign in")
end
