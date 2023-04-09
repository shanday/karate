Feature: Process Order

Background:
  * url 'http://localhost:3000/'
  * def schema = read("schemas.json")

Scenario: (+) Get Process Order
  Given path 'processOrder'
  When method get
  Then status 200

Scenario: (+) Get Process Order with specific id
  Given path 'processOrder/1'
  When method get
  Then status 200
  Then match response == schema

Scenario: (-) Get Process Order where id not found
  Given path 'processOrder/1000'
  When method get
  Then status 404

Scenario: (+) Create order
  * def order_id = (~~Math.floor(Math.random() * 100000))
  * print order_id
  * def timestamp_now = Java.type("java.lang.System").currentTimeMillis()
  * def payload =
    """
    {
      "order_id": #(order_id),
      "order_description": "Test Order",
      "order_status": "New",
      "last_updated_timestamp": "#(timestamp_now)",
      "special_order": false
    }
    """

  Given path 'processOrder'
  And request payload
  When method post
  Then status 201

  * def id = response.id
  * print 'created id is: ', id

   Given path 'processOrder/' + id
    When method get
    Then status 200
    * match response contains 
    """
        {
            "order_id": #(order_id),
            "order_description": "Test Order",
            "order_status": "New",
            "last_updated_timestamp": "#(timestamp_now)",
            "special_order": false
        }
    """
  

Scenario: (+) Update order
  * def orderid = 1
  Given path 'processOrder/' + orderid
  When method get
  Then status 200
  * def timestamp_now = Java.type("java.lang.System").currentTimeMillis()

  * def payload =
    """
    {
      "order_id": #(response.order_id),
      "order_description": "Test Order",
      "order_status": "Processed",
      "last_updated_timestamp": "#(timestamp_now)",
      "special_order": false
    }
    """

  Given path 'processOrder/' + orderid
  And request payload
  When method put
  Then status 200
  * match response contains 
  """
      {
          "order_id": #(response.order_id),
          "order_description": "Test Order",
          "order_status": "Processed",
          "last_updated_timestamp": "#(timestamp_now)",
          "special_order": false
      }
  """
  