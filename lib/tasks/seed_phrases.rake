namespace :db do
  desc "Seed the database with example phrases"
  task seed_phrases: :environment do
    phrases = [
      { text: "Break through", meaning: "To overcome a significant obstacle.", example: "She worked hard to break through the glass ceiling at work." },
      { text: "Hand it in", meaning: "To submit something, usually a document.", example: "Don’t forget to hand in your homework before the deadline." },
      { text: "Hanging over", meaning: "Something troubling or worrying lingering.", example: "The thought of the exam was hanging over me all week." },
      { text: "Come up with", meaning: "To create or think of something new.", example: "He managed to come up with a brilliant solution to the problem." },
      { text: "Spare you", meaning: "To avoid causing someone unnecessary trouble or pain.", example: "I’ll spare you the details and get straight to the point." },
      { text: "Make for", meaning: "To move towards something or contribute to a result.", example: "His humor makes for a great atmosphere at parties." },
      { text: "Rip up", meaning: "To tear something into pieces.", example: "She decided to rip up the old contract and start fresh." },
      { text: "See about", meaning: "To look into or deal with something.", example: "I’ll see about getting us some tickets to the show." }
    ]

    phrases.each do |phrase|
      Phrase.find_or_create_by(text: phrase[:text]) do |p|
        p.meaning = phrase[:meaning]
        p.example = phrase[:example]
      end
    end
    puts "Seeded phrases successfully!"
  end
end

