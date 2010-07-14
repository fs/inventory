Feature: Manage users
  As a system administrator
  I want to be able to checkout which user have which unit

  Scenario: Listing users
    Given I am logged in as "me@timurv.ru/123456"
    And a user exists with full_name: "Ivan"
    And a user exists with full_name: "Peter"
    And I am on the users page
    Then I should see "Ivan"
    And I should see "Peter"

  Scenario: Searching users
    Given I am logged in as "me@timurv.ru/123456"
    And a user exists with full_name: "Ivan"
    And a user exists with full_name: "Peter"
    And I am on the users page
    When I fill in "search_query" with "Ivan"
    And I press "Search"
    Then the "search_query" field should contain "Ivan"
    And I should see "Ivan"
    And I should not see "Peter"
    When I fill in "search_query" with "Peter"
    And I press "Search"
    Then the "search_query" field should contain "Peter"
    And I should see "Peter"
    And I should not see "Ivan"

 Scenario: Viewing user with units
    Given I am logged in as "me@timurv.ru/123456"
    And a user: "Ivan" exists with full_name: "Ivan", id: 2
    And a unit exists with name: "iMac", user: user "Ivan"
    And I am on the user page with id: 2
    Then I should see "Ivan"
    Then I should see "iMac"

 Scenario: Deleting user without units
    Given I am logged in as "me@timurv.ru/123456"
    And a user: "Ivan" exists with full_name: "Ivan", id: 2
    And I am on the users page
    When I follow "Destroy" within "div#user_2"
    Then I should be on the users page
    And I should not see "Ivan"

 # We fetching url directly b/c Destory link hidden
 #
 Scenario: Deleting user with units
    Given I am logged in as "me@timurv.ru/123456"
    And a user: "Ivan" exists with full_name: "Ivan", id: 2
    And a unit exists with name: "iMac", user: user "Ivan"
    When I send "DELETE" request to the user page with id: 2
    Then I should be on the users page
    And I should see "Ivan"
    And I should see "You can't delete user full of units"
