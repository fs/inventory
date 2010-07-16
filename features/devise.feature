Feature: Devise

  Scenario: User sign in
    Given a user: "admin" exists with email: "me@timurv.ru", password: "123456", admin: "true"
    When I go to the new user session page
    And I fill in "user_email" with "me@timurv.ru"
    And I fill in "user_password" with "123456"
    And I press "Sign in"
    Then I should be on the home page
    And I should see "Signed in successfully."
