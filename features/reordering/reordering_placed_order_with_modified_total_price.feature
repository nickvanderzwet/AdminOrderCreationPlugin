@admin_reordering @ui @javascript @todo
Feature: Reordering previously placed order with modified total price
    In order to reorder an order placed by Customer with custom order total price in the name of this Customer
    As an Administrator
    I want to be able to reorder a previously placed order with modified order total price in Admin panel

    Background:
        Given the store operates on a single channel in "United States"
        And the store has a product "Stark Coat" priced at "$100.00"
        And the store ships everywhere for free
        And the store allows paying with "Cash on Delivery"
        And there is a customer account "jon.snow@the-wall.com"
        And a customer "jon.snow@the-wall.com" placed an order "#00000666"
        And the customer bought a single "Stark Coat"
        And the customer "Jon Snow" addressed it to "Frost Alley", "90210" "Ankh-Morpork" in the "United States"
        And for the billing address of "Ned Stark" in the "Elm Street", "444" "Rivendell", "United States"
        And the customer chose "Free" shipping method with "Cash on Delivery" payment
        And I am logged in as an administrator

    Scenario: Reordering previously placed order with modified total price
        When I reorder the order "#00000666"
        And I specify order price as "$123.45"
        And I place this order
        Then I should be notified that order has been successfully created
        And the order's total should be "$123.45"

    Scenario: Trying to reorder previously placed order with modified total price below 0
        When I reorder the order "#00000666"
        And I specify order price as "-$50.00"
        And I place this order
        Then I should be notified that order price cannot be below 0
