Feature: Scripts to test the Pets module

  Background:
    * url 'http://localhost:8080/api/v3'


  Scenario: Post a new pet to the store
    Given path 'pet'
    * def petsBody = read('classpath:pets/store/pets/requests/pets_body.json')
    And request petsBody
    When method post
    Then status 200

  Scenario: Update an existing pet
    Given path 'pet'
    * def petsBodyUpdate = read('classpath:pets/store/pets/requests/pets_body_update.json')
    And request petsBodyUpdate
    When method put
    Then status 200


  Scenario: Find pets by status
    Given path 'pet/findByStatus'
    And param status = "available"
    When method get
    Then status 200

  Scenario: Delete a pet
    * def id = 1
    Given path 'pet/'+id
    When method delete
    Then status 200

  Scenario: Upload an image for a pet
    * def id = 3
    Given multipart file myFile = { read: 'classpath:pets/store/pets/resources/karateImage.jpeg', filename: 'KarateImage.jpeg', contentType: 'application/octet-stream' }
    Given path 'pet/'+id+'/uploadImage'
    * def petsBody = read('classpath:pets/store/pets/requests/pets_body.json')
    And request petsBody
    When method post
    Then status 200

  