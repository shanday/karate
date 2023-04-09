# API Test Automation Framework for Process Order

This is an automation framework designed to test and validate the /processOrder() API, which accepts a serialized Order object as input and returns an updated Order object with updated order status and last updated timestamp. The framework is designed using the Karate framework and utilizes the Cucumber reporting plugin for detailed test reporting.


####  Installation
To use this framework, you will need to have the following tools and software installed on your machine:

- Java Development Kit (JDK) version 8 or later
- IDE (Integrated Development Environment) such as Visual Studio
- git
- Maven
  ```
  brew install maven
  ```
- Install Below Extensions : Open VSC -> Extensions -> Search -> install	
  1. Extension Pack for Java https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack
  2. Karate Runner https://marketplace.visualstudio.com/items?itemName=kirkslota.karate-runner
  3. Cucumber (Gherkin) Full Support https://marketplace.visualstudio.com/items?itemName=alexkrechik.cucumberautocomplete




#### Test Cases
The framework includes several test cases designed to validate the functionality of the /processOrder() API. These test cases include both positive and negative scenarios, covering a range of possible use cases for the Order object.

Some examples of test cases include:

- Verifying that the API correctly updates the order status and last updated timestamp for a valid Order object input
- Verifying that the API returns an error message when id is not found



#### How to run tests:
- git clone https://github.com/shanday/karate.git
- Click Karate:Run


The framework is configured to use the Cucumber reporting plugin, which generates detailed HTML reports for each test execution. These reports can be found in the karate runner -> Reports -> karate-summary.html.



