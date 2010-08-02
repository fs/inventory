Feature: As a developer
  I would like to check how permissions are working in the project

  Scenario: Authentificated user without admin role should not be able to update rooms
    Given I am logged in as "me@timurv.ru/123456"
    And a room: "room" exists with name: "Room", id: 1
    When I am on the edit room page with id: 1
    Then access should be denied by authorization
    When I send "PUT" request to the room page with id: 1
    Then access should be denied by authorization

  Scenario: Authentificated user without admin role should not be able to create rooms
    Given I am logged in as "me@timurv.ru/123456"
    When I am on the new room page with id: 1
    Then access should be denied by authorization
    When I send "POST" request to the rooms page
    Then access should be denied by authorization

  Scenario: Authentificated user without admin role should not be able to update units
    Given I am logged in as "me@timurv.ru/123456"
    And a unit: "unit" exists with name: "Unit", id: 1
    When I am on the edit unit page with id: 1
    Then access should be denied by authorization
    When I send "PUT" request to the unit page with id: 1
    Then access should be denied by authorization

  Scenario: Authentificated user without admin role should not be able to create units
    Given I am logged in as "me@timurv.ru/123456"
    When I am on the new unit page with id: 1
    Then access should be denied by authorization
    When I send "POST" request to the units page
    Then access should be denied by authorization
