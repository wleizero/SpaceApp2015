# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

forests = { 
  'Web' => "Websites and web apps",
  'Environmental' => "Projects that benefit the environment",
  'Biotechnology' => "The use of living systems and organisms to develop or make useful products",
  'Games' => "Dreaming up new and amazing games"
}
forests.each_pair do |forest, description|
  f = Forest.find_or_create_by(name: forest)
  f.description = description
  f.save
end
