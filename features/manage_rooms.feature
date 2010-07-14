Feature: Manage rooms
  As a system administrator
  I want to be able to manage rooms

  Scenario: Listing rooms
    Given I am logged in as "me@timurv.ru/123456"
    And a room exists with name: "202"
    And a room exists with name: "203"
    And I am on the rooms page
    Then I should see "202"
    And I should see "203"

  Scenario: Create new room with valid data
    Given I am logged in as "me@timurv.ru/123456"
    And I am on the new room page
    When I fill in "Name" with "Room name"
    And I press "Create"
    Then I should be on the rooms page
    And I should see "Room name"
    And I should see "Room was successfully created."

  Scenario: Create new room with invalid data
    Given I am logged in as "me@timurv.ru/123456"
    And I am on the new room page
    When I fill in "Name" with ""
    And I press "Create"
    And I should see "prohibited this room from being saved"

 Scenario: Updating room with valid data
    Given I am logged in as "me@timurv.ru/123456"
    And a room exists with name: "Room name", id: 1
    And I am on the edit room page with id: 1
    And I fill in "Name" with "New room name"
    And I press "Update Room"
    Then I should be on the rooms page
    And I should see "Room was successfully updated."
    And I should see "New room name"

 Scenario: Updating room with invalid data
    Given I am logged in as "me@timurv.ru/123456"
    And a room exists with name: "Room name", id: 1
    And I am on the edit room page with id: 1
    And I fill in "Name" with ""
    And I press "Update Room"
    And I should see "prohibited this room from being saved"

 Scenario: Viewing room with units
    Given I am logged in as "me@timurv.ru/123456"
    And a room: "202" exists with name: "202"
    And a unit exists with name: "iMac", room: room "202", user: user "current_user"
    And I am on the room page with id: 1
    Then I should see "202"
    Then I should see "iMac"

 Scenario: Deleting room without units
    Given I am logged in as "me@timurv.ru/123456"
    And a room exists with name: "202"
    And I am on the rooms page
    When I follow "Destroy"
    Then I should be on the rooms page
    And I should not see "202"

 # We fetching url directly b/c Destory link hidden
 #
 Scenario: Deleting room with units
    Given I am logged in as "me@timurv.ru/123456"
    And a room: "202" exists with name: "202", id: 1
    And a unit exists with room: room "202", user: user "current_user"
    When I send "DELETE" request to the room page with id: 1
    Then I should be on the rooms page
    And I should see "202"
    And I should see "You can't delete room full of units"
