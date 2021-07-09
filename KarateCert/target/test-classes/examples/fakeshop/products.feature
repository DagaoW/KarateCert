Feature: Fakeshop API testing

  Background:
    * url apiUrl
    * def categoryResponse = read('category.json')
    * def category = categoryResponse.category
    * print category
        
  Scenario: get list of all products and create json file by the category
    Given path 'products', 'getAllProducts'
    When method Get
    Then status 201
    * def accessories = karate.jsonPath(response, "$..products[?(@.category == '" + category + "')]")
    * karate.write(accessories, 'accessories.json')
  

  