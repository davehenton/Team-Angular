require "faker"

User.destroy_all
Response.destroy_all
Answer.destroy_all
Question.destroy_all
Vote.destroy_all

10.times do
  user = User.new(username: Faker::GameOfThrones.character, email: Faker::Internet.email)
  user.password = "password"
  user.save
  question = Question.create(title: Faker::Hipster.sentence, content: Faker::Hipster.paragraph)
end

Question.all.each do |question|
  question.author = User.all.sample
  2.times { question.responses << Response.create(content: Faker::Hipster.word) }
  5.times { question.answers << Answer.create(content: Faker::Hipster.paragraph) }
  rand(5).times { question.votes << Vote.create(upvote?: true) }
  rand(5).times { question.votes << Vote.create(upvote?: false) }
  question.save
end

Answer.all.each do |answer|
  answer.answerer = User.all.sample
  2.times { answer.responses << Response.create(content: Faker::Hipster.word) }
  rand(5).times { answer.votes << Vote.create(upvote?: true) }
  rand(5).times { answer.votes << Vote.create(upvote?: false) }
  answer.save
end

Response.all.each do |response|
  response.responder = User.all.sample
  rand(5).times { response.votes << Vote.create(upvote?: true) }
  rand(5).times { response.votes << Vote.create(upvote?: false) }
  response.save
end

Vote.all.each do |vote|
  vote.voter = User.all.sample
  vote.save
end
