# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

opportunities = [
  {
    title: "Distributed Systems and Scalability",
    professor_name: "Luca Carloni",
    department: "Computer Science",
    description: "Participate in cutting-edge lab research to design and test large-scale distributed systems for modern web applications.",
    contact: "luca@cs.columbia.edu",
    requirements: "Understanding of computer networks, Lab experience with system deployments.",
    duration: "Winter Semester 2023"
  },
  {
    title: "Human-AI Interaction",
    professor_name: "Gail E Kaiser",
    department: "Computer Science",
    description: "Join our lab to design and test innovative methods of interaction between humans and artificial intelligence systems.",
    contact: "kaiser@cs.columbia.edu",
    requirements: "Experience in UI/UX design, Lab experience with user testing methodologies.",
    duration: "Spring Semester 2024"
  },
  {
    title: "Augmented Reality Systems",
    professor_name: "Stephen A. Edwards",
    department: "Computer Science",
    description: "Engage in lab work dedicated to developing augmented reality applications and testing their real-world implications.",
    contact: "sedwards@cs.columbia.edu",
    requirements: "Experience in AR/VR development, Lab experience with AR devices and platforms.",
    duration: "Fall Semester 2023"
  },
  {
    title: "Natural Language Processing for Web Data",
    professor_name: "Daniel Bauer",
    department: "Computer Science",
    description: "Our lab focuses on leveraging NLP techniques to extract meaningful insights from vast web data sources.",
    contact: "bauer@cs.columbia.edu",
    requirements: "Background in machine learning and NLP, Lab experience with web scraping and data processing.",
    duration: "Summer Semester 2023"
  },
  {
    title: "Quantum Computing Algorithms",
    professor_name: "Josh Alman",
    department: "Computer Science",
    description: "Participate in our quantum computing lab to develop algorithms capable of solving complex computational problems.",
    contact: "josh@cs.columbia.edu",
    requirements: "Understanding of quantum mechanics, Lab experience in quantum computing environments.",
    duration: "Winter Semester 2023"
  },
  {
    title: "Bioinformatics and Computational Biology",
    professor_name: "Andrew Blumberg",
    department: "Computer Science",
    description: "Work in our bioinformatics lab to develop software tools for genomic data analysis and biological research.",
    contact: "andrew.blumberg@columbia.edu",
    requirements: "Experience with genomic data, Lab experience in bioinformatics software development.",
    duration: "Spring Semester 2024"
  },
  {
    title: "Deep Learning for Natural Language Processing",
    professor_name: "Kathleen McKeown",
    department: "Computer Science",
    description: "Research the applications of deep learning in the field of NLP. Work includes improving current models and exploring new architectures for better performance.",
    contact: "kathy@cs.columbia.edu",
    requirements: "Experience with Python, Familiarity with Tensorflow or PyTorch.",
    duration: "Fall Semester 2023"
  }
]

opportunities.each do |opportunity|
  Opportunity.create!(opportunity)
end
