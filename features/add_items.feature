Feature: Adding Items
  As a parent,
  I want to add items I buy to my list,
  So that I can be alerted about any recalls

@javascript
Scenario: Adding a non-recalled item
  Given I'm logged in as a parent
  And the item "Q-Tip" has not been recalled
  When I add an item named "Q-Tip"
  And I view my list of items
  Then I should not see an alert

@javascript
Scenario: Adding a recalled item
  Given I'm logged in as a parent
  And the item "Babylicious Crib" has been recalled
  When I add an item named "Babylicious Crib"
  And I view my list of items
  Then I should see an alert
