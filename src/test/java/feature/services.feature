Feature: Test BestBuy Services API

  @createService
  Scenario: Create a Service
    Given url baseUrl+'/services'
    * def reqeustBody =
      """
      {
      "name": "Custom PC Builder",
      }
      """
    And request reqeustBody
    When method POST
    * print response
    Then status 201
    * def newServiceId = response.id
    * print newServiceId
    And match $.id == '#present'
    And match $.name == 'Custom PC Builder'

  @deleteAServiceById
  Scenario: Delete A service by Id
    Given url baseUrl+'/services'
    * def serviceToBeDeleted = 31
    And path serviceToBeDeleted
    When method DELETE
    Then status 200
    * print response

  @updateAServiceDetail
  Scenario: Update a Product detail
    Given url baseUrl+'/services'
    * def serviceToBeUpdated = 27
    * def reqeustBody =
      """
      {
        "name": "Custom PC Builder",
      }
      """
    And request reqeustBody
    And path serviceToBeUpdated
    When method PATCH
    Then status 200
    And match response.name == 'Custom PC Builder'

  @getServiceDetailsById
  Scenario: Get Product details by ID
    * call read('services.feature@createService')
    # def newServiceId = 27
    Given url baseUrl +'/services'
    And path newServiceId
    * print newServiceId
    When method GET
    * print response
    Then status 200
    And match response.id == newServiceId

  @GetListOfServices
  Scenario: Get List of all Services
    Given url baseUrl+'/services/'
    * def querry = {$limit:20, $skip:10}
    And params querry
    When method GET
    Then status 200
    * print response
