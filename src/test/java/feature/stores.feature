Feature: Test BestBuy Stores API

  @createStore
  Scenario: Create a Store
    Given url baseUrl+'/stores'
    * def reqeustBody =
      """
       {
      "name": "Queen St Best Buy",
      "type": "Franchise",
      "address": "10 Queen St",
      "city": "Mississauga",
      "state": "Ontario",
      "zip": "L3D5T1",
      "lat": 277,
      "lng": 254,
      "hours": "9AM TO 5PM"
      }
      """
    And request reqeustBody
    When method POST
    * print response
    Then status 201
    * def newServiceId = response.id
    * print newServiceId
    And match $.id == '#present'
    And match $.name == 'Queen St Best Buy'

  @deleteAStoreById
  Scenario: Delete A Store by Id
    Given url baseUrl+'/stores'
    * def storeToBeDeleted = 8932
    And path storeToBeDeleted
    When method DELETE
    Then status 200
    * print response

  @updateAStoreDetail
  Scenario: Update a Store detail
    Given url baseUrl+'/stores'
    * def storeToBeUpdated = 8936
    * def reqeustBody =
      """
      {
         "address2": "Opposite to community center",
      }
      """
    And request reqeustBody
    And path storeToBeUpdated
    When method PATCH
    Then status 200
    And match $.id == 8936
    And match response.name == 'Queen St Best Buy'
    And match $.address2 == 'Opposite to community center'

  @getStoreDetailsById 
  Scenario: Get Product details by ID
    # call read('services.feature@createService')
    * def newStoreId = 8936
    Given url baseUrl +'/stores'
    And path newStoreId
    * print newStoreId
    When method GET
    * print response
    Then status 200
    And match response.id == newStoreId

  @GetListOfStores
  Scenario: Get List of all Products
    Given url baseUrl+'/stores/'
    * def querry = {$limit:20, $skip:10}
    And params querry
    When method GET
    Then status 200
    * print response
