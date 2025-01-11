Feature: Scripts to test the User module

  Background:
    * url 'http://localhost:8080/api/v3'


  Scenario: Create a new User
    Given path 'user'
    * def userBody = read('classpath:pets/store/user/requests/user_body.json')
    And request userBody
    When method post
    Then status 200


  Scenario: Login with valid credentials
    Given path 'user/login'
    And param username = "asd"
    And param password = "asdsad"
    When method get
    Then status 200
    And match response contains "Logged"

  Scenario: Fetch user details by username
    Given path 'user/theUser'
    When method get
    Then status 200

  @testTag
  Scenario: Delete a User
    Given path 'user/1234214'
    When method delete
    Then status 200


  