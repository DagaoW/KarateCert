Feature: Sign in an user

Background: 
    * url apiUrl

Scenario: Log in user
    Given path 'users', 'signin'
    And request 
    """
        {
            "email":"da9marka@email.com",
            "password":"Qaz12345"
        }

    """
    When method Post
    Then status 201
    * def token = response.token
    * match response.token == token
    * match response.message == "User signed in successfully"

