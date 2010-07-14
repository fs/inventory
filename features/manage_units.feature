Feature: Manage units
  As a system administrator
  I want to be able to manage untis

  Scenario: Listing units
    Given I am logged in as "me@timurv.ru/123456"
    And a unit: "unit1" exists with name: "Mac mini"
    And a unit: "unit2" exists with name: "PC box"
    And I am on the units page
    Then I should see "Mac mini"
    And I should see "PC box"

  Scenario: Listing units on depot
    Given I am logged in as "me@timurv.ru/123456"
    And a unit: "unit1" exists with name: "Mac mini", on_depot: true
    And a unit: "unit2" exists with name: "PC box", on_depot: false
    And I am on the on depot units page
    Then I should see "Mac mini"
    And I should not see "PC box"

  Scenario: Searching units
    Given I am logged in as "me@timurv.ru/123456"
    And a unit: "unit1" exists with name: "Mac mini"
    And a unit: "unit2" exists with name: "PC box"
    And I am on the units page
    When I fill in "search_query" with "Mac"
    And I press "Search"
    Then the "search_query" field should contain "Mac"
    And I should see "Mac mini"
    And I should not see "PC box"
    When I fill in "search_query" with "PC"
    And I press "Search"
    Then the "search_query" field should contain "PC"
    And I should see "PC box"
    And I should not see "Mac mini"

  Scenario: Create new unit with valid data
    Given I am logged in as "me@timurv.ru/123456"
    And a room exists with name: "202"
    And I am on the new unit page
    When I fill in "Inv ID" with "1"
    And I select "Box" from "Type"
    And I fill in "Name" with "Mac mini"
    And I fill in "Description" with "Some desc"
    And I select "202" from "Room"
    And I select "User name (me@timurv.ru)" from "User"
    And I press "Create"
    Then I should be on the units page
    And I should see "Mac mini"
    And I should see "Unit was successfully created."

  Scenario: Create new unit with empty inv_id
    Given I am logged in as "me@timurv.ru/123456"
    And a room exists with name: "202"
    And I am on the new unit page
    When I fill in "Inv ID" with ""
    And I select "Box" from "Type"
    And I fill in "Name" with "Mac mini"
    And I fill in "Description" with "Some desc"
    And I select "202" from "Room"
    And I select "User name (me@timurv.ru)" from "User"
    And I press "Create"
    Then I should be on the units page
    And I should see "Mac mini"
    And I should see "Unit was successfully created."

  Scenario: Create new unit with invalid data
    Given I am logged in as "me@timurv.ru/123456"
    And I am on the new unit page
    When I fill in "Inv ID" with ""
    And I press "Create"
    And I should see "prohibited this unit from being saved"

 Scenario: Updating unit with valid data
    Given I am logged in as "me@timurv.ru/123456"
    And a unit: "unit1" exists with name: "Mac mini", id: 1
    And I am on the edit unit page with id: 1
    And I fill in "Name" with "PC Box"
    And I press "Update Unit"
    Then I should be on the units page
    And I should see "Unit was successfully updated."
    And I should see "PC Box"

 Scenario: Updating unit with invalid data
    Given I am logged in as "me@timurv.ru/123456"
    And a unit: "unit1" exists with name: "Mac mini", id: 1
    And I am on the edit unit page with id: 1
    And I fill in "Name" with ""
    And I press "Update Unit"
    And I should see "prohibited this unit from being saved"

 Scenario: Deleting unit
    Given I am logged in as "me@timurv.ru/123456"
    And a unit: "unit1" exists with name: "Mac mini", id: 1
    And I am on the units page
    When I follow "Destroy"
    Then I should be on the units page
    And I should not see "Mac mini"
