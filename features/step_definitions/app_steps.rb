Given /^I am logged in as "(.*?)\/(.*?)"$/ do |email, password|
  Given %{a user: "admin" exists with email: "#{email}", password: "#{password}, admin: true"}
  And %{I go to the new user session page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

When /^I send "(GET|POST|PUT|DELETE)" request to (.+)$/ do |method, page_name|
  Capybara.current_session.driver.process(method.downcase.to_sym, path_to(page_name))
end

