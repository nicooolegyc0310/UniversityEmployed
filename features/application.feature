Feature: Viewing Applications

  As a logged-in user
  I want to view my applications
  So that I can see the opportunities I have applied for

Background: 
    Given the following user exists:
        | email      | password | user_type |
        | test3@gmail.com | password | student   |
    And the following opportunities exist:
        | title      | professor_name | department       | description           | contact               | requirements | duration          | capacity |
        | Opportunity 1 | Prof A         | Computer Science | Description for Opp 1 | profa@example.com     | Requirement 1 | Winter Semester 2023 | 2        |
        | Opportunity 2 | Prof B         | Computer Science | Description for Opp 2 | profb@example.com     | Requirement 2 | Spring Semester 2023 | 3        |
        | Opportunity 3 | Prof C         | Computer Science | Description for Opp 3 | profc@example.com     | Requirement 3 | Fall Semester 2023   | 4        |
    And the following applications exist for "test3@gmail.com":
        | opportunity_title | status   |
        | Opportunity 1     | pending  |
        | Opportunity 2     | approved |
        | Opportunity 3     | rejected |

  Scenario: User views their applications
    Then create a new student with "test3@gmail.com" email, "test3" password, "test3" firstname, and "test3" lastname
    When I go to /users
    Then I should see a list of my applications
