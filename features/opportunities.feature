Feature: Display following opportunties

  As a student I want to see these opportunties

Background: opportunties have been added to database

  Given the following opportunities exist:
| title                               | professor_name     | department       | description                                                                                                              | contact                  | requirements                                                                   | duration             |  capacity  |
| Distributed Systems and Scalability | Luca Carloni       | Computer Science | Participate in cutting-edge lab research to design and test large-scale distributed systems for modern web applications. | luca@cs.columbia.edu     | Understanding of computer networks, Lab experience with system deployments.    | Winter Semester 2023 |     2      |
| Human-AI Interaction                | Gail E Kaiser      | Computer Science | Join our lab to design and test innovative methods of interaction between humans and artificial intelligence systems.    | kaiser@cs.columbia.edu   | Experience in UI/UX design, Lab experience with user testing methodologies.    | Spring Semester 2024 |     5      |
| Augmented Reality Systems           | Stephen A. Edwards | Computer Science | Engage in lab work dedicated to developing augmented reality applications and testing their real-world implications.     | sedwards@cs.columbia.edu | Experience in AR/VR development, Lab experience with AR devices and platforms. | Fall Semester 2023   |     3      |
| Augmented Reality Systems 2         | Stephen A. Edwards | Computer Science | Engage in lab work dedicated to developing augmented reality applications and testing their real-world implications.     | sedwards@cs.columbia.edu | Experience in AR/VR development, Lab experience with AR devices and platforms. | Spring Semester 2023 |     3      |

Scenario: see all opportunities
 Then 4 seed opportunities should exist

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
  Given I visit the details page for "Job2"
  When I follow "Delete"
  When I go to /opportunities
  Then I should not see "Job2"

Scenario: create student user and see all scenarios
  Then create a new student with "test2@gmail.com" email, "test2" password, "test2" firstname, and "test2" lastname
  When I go to /opportunities
  Then I should see "Distributed Systems and Scalability"
  Then I log out
  When I try to log in with "test2@gmail.com" email and "test2" password/
  Then I should see "Distributed Systems and Scalability"



Scenario: create grad student user and see all scenarios
  Then create a new grad student with "test8@gmail.com" email, "test2" password, "test2" firstname, and "test2" lastname
  When I go to /opportunities
  Then I should see "Distributed Systems and Scalability"
  Then I log out
  When I try to log in with "test8@gmail.com" email and "test2" password/
  Then I should see "Distributed Systems and Scalability"

Scenario: login logout
  Then create a new professor with "test3@gmail.com" email, "test3" password, "test3" firstname, and "test3" lastname
  Then I should see "Distributed Systems and Scalability"
  When I go to /login
  Then I should see "Distributed Systems and Scalability"
  Then I log out
  When I try to log in with "test3@gmail.com" email and "test3" password/
  Then I should see "Distributed Systems and Scalability"

Scenario: try to access unauthorized pages
  When I go to /opportunities
  Then I should see "You must be logged in to access this page."  
  When I go to /users
  Then I should see "You must be logged in to access this page."

Scenario: sort by Professor 
  Then create a new professor with "test3@gmail.com" email, "test3" password, "test3" firstname, and "test3" lastname
  Then I should see "Distributed Systems and Scalability"
  When I go to /login
  Then I should see "Distributed Systems and Scalability"
  Then I log out
  When I try to log in with "test3@gmail.com" email and "test3" password/
  Then I should see "Distributed Systems and Scalability"
  When I enter "Stephen A. Edwards" as my Filter by Professor
  Then I click on "Filter"
  Then I should see "Augmented Reality Systems 2"
  Then I should not see "Distributed Systems and Scalability"

Scenario: student applies to Opportunity
  Then create a new student with "test4@gmail.com" email, "test4" password, "test4" firstname, and "test4" lastname
  When I go to /opportunities
  Given I visit the details page for "Distributed Systems and Scalability"
  Then I should see "Duration: Winter Semester 2023"
  When I follow "Apply"
  Then I go to /users

Scenario: professor edits opportunity he didn't create
  Then create a new professor with "test4@gmail.com" email, "test4" password, "test4" firstname, and "test4" lastname
  When I go to /opportunities
  Given I visit the details page for "Distributed Systems and Scalability"
  Then I go to /opportunities/1/edit
  Then I should see "Can't edit opportunity you didn't create."

Scenario: student re-applies to Opportunity
  Then create a new student with "test5@gmail.com" email, "test4" password, "test4" firstname, and "test4" lastname
  When I go to /opportunities
  Given I visit the details page for "Distributed Systems and Scalability"
  Then I should see "Duration: Winter Semester 2023"
  When I follow "Apply"
  Then I go to /users
  Given I visit the details page for "Distributed Systems and Scalability"
  When I follow "Apply"
  Then I should see "You have already applied to this opportunity."












