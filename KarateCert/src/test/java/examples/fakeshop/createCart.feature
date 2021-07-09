Feature: Create a cart with products

Background: 
    * url apiUrl
    * def signIpResponse = callonce read('logIn.feature')
    * def accessToken = signIpResponse.token
   


Scenario: Create a cart with accessories
    Given header Authorization = 'Bearer ' + accessToken
    Given path 'carts', 'addToCart'
    And request { id: "#(id)"}
    When method Post
    Then status 201
    And match response.message == "Product added to cart"
