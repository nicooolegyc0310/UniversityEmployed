
Then /Create a new user with "(.*)" username and "(.*)" password and "(.*)" role/ do | username, pwd, role|
  @user = User.create!({username: username, password: pwd, user_type: role})
  visit "/login"
  fill_in("username", :with => @user.username)
  fill_in("password", :with => @user.password)
  click_button("Log In")
end
