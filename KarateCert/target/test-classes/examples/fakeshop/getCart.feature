Feature: Create a cart with products

Background: 
    * url apiUrl
    * def signIpResponse = callonce read('logIn.feature')
    * def accessToken = signIpResponse.token
    * def products = call read('products.feature')
    * def accessoriesList = read('file:target/accessories.json')
    * def cartCreator = read('createCart.feature')
    * def result = callonce cartCreator accessoriesList
      
Scenario: Get cart
        Given header Authorization = 'Bearer ' + accessToken
        Given path 'carts', 'getCart'
        When method Get
        Then status 201
        * print response
        And match response.cart contains deep accessoriesList
        

 Scenario: Delete cart
    Given header Authorization = 'Bearer ' + accessToken
    Given path 'carts', 'emptyCart'
    When method Post
    Then status 201
    And match response.message == 'Cart is now empty'


Scenario: Check if cart is empty
    Given header Authorization = 'Bearer ' + accessToken
    Given path 'carts', 'getCart'
    When method Get
    Then status 201
    And match response.message == 'Cart is empty'