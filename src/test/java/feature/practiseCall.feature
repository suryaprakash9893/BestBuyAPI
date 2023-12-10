Feature: Sharing Variable Between Scenarios

@Define
  Scenario: Scenario 1 - Set Variable
    * def firstName = 'Surya'
    * def lastName = 'Prakash'
    * print 'Scenario 1: Setting variables - firstName:', firstName, 'lastName:', lastName

@Reuse
  Scenario: Scenario 2 - Use Variable
    * call read('practiseCall.feature@Define')
    * print 'Scenario 2: Using variables - firstName:', firstName, 'lastName:', lastName