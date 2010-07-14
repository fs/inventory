Given /^I am logged in as "(.*?)\/(.*?)"$/ do |email, password|
  Given %{a user: "current_user" exists with email: "#{email}", password: "#{password}"}
  And %{I go to the new user session page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end
