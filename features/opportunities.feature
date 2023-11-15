Feature: Display following opportunties

  As a student I want to see these opportunties

Background: opportunties have been added to database

  Given the following opportunities exist:
| title                               | professor_name     | department       | description                                                                                                              | contact                  | requirements                                                                   | duration             |  capacity  |
| Distributed Systems and Scalability | Luca Carloni       | Computer Science | Participate in cutting-edge lab research to design and test large-scale distributed systems for modern web applications. | luca@cs.columbia.edu     | Understanding of computer networks, Lab experience with system deployments.    | Winter Semester 2023 |     2      |
| Human-AI Interaction                | Gail E Kaiser      | Computer Science | Join our lab to design and test innovative methods of interaction between humans and artificial intelligence systems.    | kaiser@cs.columbia.edu   | Experience in UI/UX design, Lab experience with user testing methodologies.    | Spring Semester 2024 |     5      |
| Augmented Reality Systems           | Stephen A. Edwards | Computer Science | Engage in lab work dedicated to developing augmented reality applications and testing their real-world implications.     | sedwards@cs.columbia.edu | Experience in AR/VR development, Lab experience with AR devices and platforms. | Fall Semester 2023   |     3      |

Scenario: see all opportunities
 Then 3 seed opportunities should exist

Scenario: try to login with incorrect credientals
  When I try to log in with "test@gmail.com" email and "pwd123" password/
  Then I should see "Incorrect username or password"

Scenario: create a prof user and add, edit, and delete opportunity
  Then create a new professor with "test@gmail.com" email, "test" password, "test" firstname, and "test" lastname
  When I go to /opportunities
  Then I follow "Add new opportunity"
  Then I add opportunity Job
  Then I should see "Job"
  When I go to /users
  Then I should see "Job"
  Given I visit the details page for "Job"
  When I follow "Edit"
  Then I change the title to "Job2"
  Then I delete opportunity Job2
  When I go to /opportunities
  Then I should not see "Job2"

Scenario: create student user and see all scenarios
  Then create a new student with "test2@gmail.com" email, "test2" password, "test2" firstname, and "test2" lastname
  When I go to /opportunities
  Then I should see "Distributed Systems and Scalability"

Scenario: login logout
  Then create a new professor with "test3@gmail.com" email, "test3" password, "test3" firstname, and "test3" lastname
  Then I should see "Distributed Systems and Scalability"
  Then I log out
  When I try to log in with "test3@gmail.com" email and "test3" password/
  Then I should see "Distributed Systems and Scalability"

Scenario: try to access unauthorized pages
  When I go to /opportunities
  Then I should see "You must be logged in to access this page."  
  When I go to /users
  Then I should see "You must be logged in to access this page."






