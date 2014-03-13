Feature: Remove Items
  As a parent
  I want to remove items I no longer own
  So I don't get false notifications

Scenario: Removing an item
  Given I'm logged in as a parent
  And I have 5 items
  When I remove the first item
  Then I should have 4 items
