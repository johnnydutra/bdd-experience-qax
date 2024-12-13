Feature: Order

  As a Starbugs user, I want to choose and buy coffee products so that I can receive them at my home address and pay on delivery

  @test
  Scenario: Successful order
    Given that I am at the Starbugs homepage
    And that I have initiated the purchase of the "Expresso Tradicional" item
    When I search for the following CEP: "05426030"
    And provide address details:
      | number     | 1000    |
      | complement | Sala 13 |
    And select "Cartão de Débito" as payment option
    And finish checkout
    Then I am redirected to the confirmation page
    And the delivery time should be displayed as "20 min - 30 min"