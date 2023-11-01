# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

research_opportunities = [
  { title: 'Data Science Internship', position: 'Data Scientist Intern', description: 'Exciting opportunity to work on real-world data science projects.', start_date: '2023-10-31', end_date: '2024-01-31' },
]

research_opportunities.each do |opportunity|
  ResearchOpportunity.create!(opportunity)
end