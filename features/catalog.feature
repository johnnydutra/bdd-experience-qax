Feature: Product catalog
  As a Starbug user I want to see the product catalog in the home page
  So that I can choose and know more about the available products

  Scenario: Access the product catalog in the home page
    When I access the Starbugs home page
    Then I should see a list of available products

  Scenario: Start product purchase
    Given that I am at the Starbugs homepage
    And I want to purchase a product:
      | name     | Expresso Gelado |
      | price    | R$ 9,99         |
      | delivery | R$ 10,00        |
    When I start the purchase of that item
    Then I should see the checkout page with the product details
    And the order total should be "R$ 19,99"

  Scenario: Unavailable product
    Given that I am at the Starbugs homepage
    And I want to purchase a product:
      | name | Expresso Cremoso |
    When I start the purchase of that item
    Then I should see a popup stating that the product is unavailable