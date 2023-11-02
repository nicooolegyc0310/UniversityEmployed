Feature: Display following opportunties

  As a student I want to see these opportunties

Background: opportunties have been added to database

  Given the following opportunities exist:
| title                               | professor_name     | department       | description                                                                                                              | contact                  | requirements                                                                   | duration             |  capacity  |
| Distributed Systems and Scalability | Luca Carloni       | Computer Science | Participate in cutting-edge lab research to design and test large-scale distributed systems for modern web applications. | luca@cs.columbia.edu     | Understanding of computer networks, Lab experience with system deployments.    | Winter Semester 2023 |     2      |
| Human-AI Interaction                | Gail E Kaiser      | Computer Science | Join our lab to design and test innovative methods of interaction between humans and artificial intelligence systems.    | kaiser@cs.columbia.edu   | Experience in UI/UX design, Lab experience with user testing methodologies.    | Spring Semester 2024 |     5      |
| Augmented Reality Systems           | Stephen A. Edwards | Computer Science | Engage in lab work dedicated to developing augmented reality applications and testing their real-world implications.     | sedwards@cs.columbia.edu | Experience in AR/VR development, Lab experience with AR devices and platforms. | Fall Semester 2023   |     3      |

Scenario: see all movies
 Then 3 seed movies should exist

Scenario: create a prof user and add and delete opportunity
  Then Create a new user with "test" username and "test" password and "professor" role
  When I go to /opportunities
  Then I follow "Add new opportunity"
  Then I add opportunity Job
  Then I should see "Job"
  Then I delete opportunity Job
  When I go to /opportunities
  Then I should not see "Job"

Scenario: create student user and see all scenarios
  Then Create a new user with "test" username and "test" password and "student" role
  When I go to /opportunities
  Then I should see "Distributed Systems and Scalability"

