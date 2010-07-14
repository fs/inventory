Feature: Manage user units
  As a system administrator
  I want to be able to checkout which user have which unit

 Scenario: Viewing user with units
   Given I am logged in as "me@timurv.ru/123456"
   And a user: "Ivan" exists with full_name: "Ivan", id: 2
   And a unit: "unit1" exists with name: "iMac", user: user "Ivan"
   When I go to the user units page with id: 2
   Then I should see "Ivan"
   And I should see "iMac"

 Scenario: Placing unit on depot
   Given I am logged in as "me@timurv.ru/123456"
   And a user: "Ivan" exists with full_name: "Ivan", id: 2
   And a unit: "unit1" exists with name: "iMac", user: user "Ivan"
   And I am on the user units page with id: 2
   When I follow "On depot"
   Then I should be on the user units page with id: 2
   And I should see "Unit placed on depot."
   And a unit: "unit1" should be on depot

