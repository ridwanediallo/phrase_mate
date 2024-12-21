# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

phrases = [
  {
    text: "Break through",
    meaning: "To achieve success or overcome a barrier",
    examples: "After months of hard work, she broke through and finished the project."
  },
  {
    text: "Hand it in",
    meaning: "To submit something, typically an assignment",
    examples: "Don’t forget to hand in your report by tomorrow."
  },
  {
    text: "Hanging over",
    meaning: "To cause worry or anxiety",
    examples: "The fear of failure was hanging over him throughout the semester."
  },
  {
    text: "Come up with",
    meaning: "To think of an idea or plan",
    examples: "We need to come up with a solution before the deadline."
  },
  {
    text: "Make for",
    meaning: "To move toward something or contribute to a result",
    examples: "Clear instructions make for a smoother onboarding process."
  },
]

phrases.each do |phrase|
  Phrase.find_or_create_by(text: phrase[:text]) do |p|
    p.meaning = phrase[:meaning]
    p.examples = phrase[:examples]
  end
end

# Create admin user
admin = User.find_or_create_by(email: "admin@phrasemate.com") do |user|
  user.password = "admin123" # You should change this in production
  user.role = "admin"
end

puts "Admin user created with email: admin@phrasemate.com"
