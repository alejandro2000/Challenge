Feature: Scripts to test the Store module

  Background:
    * url 'http://localhost:8080/api/v3'


  Scenario: Place an order for a pet
    Given path 'store/order'
    * def petOrder = read('classpath:pets/store/store/requests/pet_order.json')
    And request petOrder
    When method post
    Then status 200
    * def orderId = response.id
    And match response.complete == true

  Scenario: Get Order details by ID
    Given path 'store/order/'+10
    When method get
    Then status 200

  Scenario: Delete an order
    Given path 'store/order/'+1435441324213232212
    When method delete
    Then status 404

  Scenario: fetch inventory status
    Given path 'store/inventory/'
    When method get
    Then status 200
    And match response.approved == 57

  