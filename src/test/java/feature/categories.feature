Feature: Test BestBuy categories API

  @createACategory
  Scenario: Create a Category
    Given url baseUrl+'/categories'
    * def reqeustBody =
      """
      {
      "name": "PC builder",
      "id": "PC-DOC"
      }
      """
    And request reqeustBody
    When method POST
    * print response
    Then status 201
    * def newServiceId = response.id
    * print newServiceId
    And match $.id == 'PC-DOC'

  @deleteACategoryById
  Scenario: Delete A Category by Id
    Given url baseUrl+'/categories'
    * def categoryToBeDeleted = "vr2711sts"
    And path categoryToBeDeleted
    When method DELETE
    Then status 200
    * print response

  @updateACategoryDetail
  Scenario: Update a Category detail
    Given url baseUrl+'/categories'
    * def categoryToBeUpdated = "RCNWHEEL"
    * def reqeustBody =
      """
      {
         "name": "Fanatec racing wheel Tuner",
      }
      """
    And request reqeustBody
    And path categoryToBeUpdated
    When method PATCH
    Then status 200
    And match $.id == "RCNWHEEL"
    And match response.name == 'Fanatec racing wheel Tuner'
    
  @getCategoryDetailsById
  Scenario: Get Category details by ID
    # call read('categories.feature@createCategory')
    * def newCategoryId = "RCNWHEEL"
    Given url baseUrl +'/categories'
    And path newCategoryId
    * print newCategoryId
    When method GET
    * print response
    Then status 200
    And match response.id == newCategoryId

  @getListOfCategories
  Scenario: Get List of all Categories
    Given url baseUrl+'/categories/'
    * def querry = {$limit:20, $skip:10}
    And params querry
    When method GET
    Then status 200
    * print response
