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
    meaning: "To overcome an obstacle or challenge", 
    examples: ["She managed to break through her fears.", "The team broke through the barriers and succeeded."], 
    category: "Phrasal Verb", 
    difficulty_level: "Intermediate", 
    tags: ["overcome", "challenges"], 
    related_phrases: ["Overcome", "Push through"], 
    audio_url: "https://example.com/audio/break_through.mp3" 
  },
  { 
    text: "Come up with", 
    meaning: "To think of an idea or solution", 
    examples: ["He came up with a brilliant plan.", "She always comes up with creative solutions."], 
    category: "Phrasal Verb", 
    difficulty_level: "Beginner", 
    tags: ["idea", "solution"], 
    related_phrases: ["Think of", "Conceive"], 
    audio_url: "https://example.com/audio/come_up_with.mp3" 
  },
  { 
    text: "Hit the nail on the head", 
    meaning: "To describe exactly what is causing a situation or problem", 
    examples: ["When she said the team needed more resources, she hit the nail on the head.", "His analysis hit the nail on the head."], 
    category: "Idiom", 
    difficulty_level: "Advanced", 
    tags: ["accuracy", "precision"], 
    related_phrases: ["Get it right", "Spot on"], 
    audio_url: "https://example.com/audio/hit_the_nail.mp3" 
  },
  { 
    text: "Bite the bullet", 
    meaning: "To do something unpleasant or difficult that is unavoidable", 
    examples: ["He decided to bite the bullet and accept the job offer.", "Sometimes you just have to bite the bullet and face the consequences."], 
    category: "Idiom", 
    difficulty_level: "Intermediate", 
    tags: ["courage", "acceptance"], 
    related_phrases: ["Face the music", "Take the plunge"], 
    audio_url: "https://example.com/audio/bite_the_bullet.mp3" 
  },
  { 
    text: "Burn the midnight oil", 
    meaning: "To work late into the night", 
    examples: ["She was burning the midnight oil to finish the project on time.", "He often burns the midnight oil to meet deadlines."], 
    category: "Idiom", 
    difficulty_level: "Advanced", 
    tags: ["work", "late"], 
    related_phrases: ["Work late", "Stay up"], 
    audio_url: "https://example.com/audio/burn_midnight_oil.mp3" 
  },
  { 
    text: "Kick the bucket", 
    meaning: "To die", 
    examples: ["He kicked the bucket after a long illness.", "The old car finally kicked the bucket."], 
    category: "Slang", 
    difficulty_level: "Advanced", 
    tags: ["death", "informal"], 
    related_phrases: ["Pass away", "Depart"], 
    audio_url: "https://example.com/audio/kick_the_bucket.mp3" 
  },
  { 
    text: "Under the weather", 
    meaning: "Feeling ill", 
    examples: ["I'm feeling a bit under the weather today.", "He was under the weather and couldn't attend the meeting."], 
    category: "Idiom", 
    difficulty_level: "Intermediate", 
    tags: ["illness", "health"], 
    related_phrases: ["Not well", "Sick"], 
    audio_url: "https://example.com/audio/under_the_weather.mp3" 
  },
  { 
    text: "Break the ice", 
    meaning: "To initiate conversation in a social setting", 
    examples: ["He told a joke to break the ice.", "Starting with a compliment can break the ice.", "A warm smile can help break the ice."], 
    category: "Phrasal Verb", 
    difficulty_level: "Beginner", 
    tags: ["social", "conversation"], 
    related_phrases: ["Start talking", "Initiate"], 
    audio_url: "https://example.com/audio/break_the_ice.mp3" 
  },
  { 
    text: "Cut to the chase", 
    meaning: "To get to the point without wasting time", 
    examples: ["Let's cut to the chase and discuss the main issue.", "He cut to the chase and told us the news."], 
    category: "Idiom", 
    difficulty_level: "Advanced", 
    tags: ["direct", "concise"], 
    related_phrases: ["Get to the point", "Be direct"], 
    audio_url: "https://example.com/audio/cut_to_the_chase.mp3" 
  },
  { 
    text: "Call it a day", 
    meaning: "To stop working for the day", 
    examples: ["Let's call it a day and finish this tomorrow.", "After a long meeting, we decided to call it a day."], 
    category: "Idiom", 
    difficulty_level: "Beginner", 
    tags: ["work", "end"], 
    related_phrases: ["Stop working", "Finish up"], 
    audio_url: "https://example.com/audio/call_it_a_day.mp3" 
  },
  { 
    text: "Throw in the towel", 
    meaning: "To give up or admit defeat", 
    examples: ["After several failed attempts, he decided to throw in the towel.", "She threw in the towel when she realized she couldn't win."], 
    category: "Idiom", 
    difficulty_level: "Intermediate", 
    tags: ["give up", "defeat"], 
    related_phrases: ["Surrender", "Give up"], 
    audio_url: "https://example.com/audio/throw_in_the_towel.mp3" 
  },
  { 
    text: "Jump on the bandwagon", 
    meaning: "To join a popular activity or trend", 
    examples: ["Everyone is jumping on the bandwagon of the new fitness craze.", "She jumped on the bandwagon and started the new diet.", "Many companies are jumping on the bandwagon of sustainable practices."], 
    category: "Idiom", 
    difficulty_level: "Intermediate", 
    tags: ["trend", "popular"], 
    related_phrases: ["Join in", "Follow the crowd"], 
    audio_url: "https://example.com/audio/jump_on_bandwagon.mp3" 
  }
]

# Adding tags to the database
Tag.create([{ name: 'Submission' }, { name: 'Assignment' }, { name: 'Anxiety' }, { name: 'Worry' }, { name: 'Movement' }, { name: 'Contribution' }, { name: 'Direct' }, { name: 'Idiom' }, { name: 'Advanced' }, { name: 'Overcome' }, { name: 'Challenge' }, { name: 'Intermediate' }, { name: 'Idea' }, { name: 'Solution' }, { name: 'Beginner' }, { name: 'Accuracy' }, { name: 'Courage' }, { name: 'Work' }, { name: 'Late Night' }, { name: 'Death' }, { name: 'Slang' }])

# Associate tags with phrases by tag names
phrases.each do |phrase|
  p = Phrase.find_or_initialize_by(text: phrase[:text])
  p.update(
    meaning: phrase[:meaning],
    examples: phrase[:examples],
    category: phrase[:category],
    difficulty_level: phrase[:difficulty_level],
    audio_url: phrase[:audio_url]
  )
  tag_names = phrase[:tags]
  tags = Tag.where(name: tag_names)
  p.tags = tags
end

# Create admin user
admin = User.find_or_create_by(email: "admin@phrasemate.com") do |user|
  user.password = "admin123" # You should change this in production
  user.role = "admin"
end

puts "Admin user created with email: admin@phrasemate.com"
