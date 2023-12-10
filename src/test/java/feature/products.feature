Feature: Test Product API

Background: 
* def id = 20
  @createProduct @Ignore
  Scenario: Create a Product
    Given url baseUrl+'/products'
    * def reqeustBody =
      """
      {
        "name": "Fanatec wrc Racing wheel",
        "type": "Sim Racing Wheel",
        "price": 1299,
        "shipping": 200,
        "upc": "FANWRC",
        "description": "This is a wrc Racing wheel from Fanatec.",
        "manufacturer": "Fanatec",
        "model": "FANWRC",
      }
      """
    And request reqeustBody
    When method POST
    * print response.id
    Then status 201
    * def newProductId = response.id
    * print newProductId
    And match $.id == '#present'
    And match $.name == 'Fanatec wrc Racing wheel'

  @deleteAProductById
  Scenario: Delete A product by it's ID
    Given url baseUrl+'/products'
    * def productToBeDeleted = 9999707
    And path productToBeDeleted
    When method DELETE
    Then status 200
    * print response

  @updateAProductDetail @Ignore
  Scenario: Update a Product detail
    Given url baseUrl+'/products'
    * def productToBeUpdated = 9999701
    * def reqeustBody =
      """
      {
        "name": "Logitech Dual clutch racing wheel",
        "price": 699,
        "shipping": 50,
        "manufacturer": "Logitech",
        "upc": "LOGIDULCLH",
        "description": "This is a Dual clutch racing wheel",
        "model": "LOGIDULCLH"
      }
      """
    And request reqeustBody
    And path productToBeUpdated
    When method PATCH
    Then status 200
    And match response.name == 'Logitech Dual clutch racing wheel'

  @getProductdetailsbyId 
  Scenario: Get Product details by ID
    # call read('postProduct.feature@createProduct')
    * def newProductId = 9999701
    Given url baseUrl +'/products'
    And path newProductId
    * print newProductId
    When method GET
    * print response
    Then status 200
    And match response.id == newProductId

  @GetListOfProducts @Ignore
  Scenario: Get List of all Products
    Given url baseUrl+'/products/'
    * def querry = {$limit:20, $skip:10}
    And params querry
    When method GET
    Then status 200
    * print response
