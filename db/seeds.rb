10.times do
  User.create!(name: Faker::name, email: Faker::email, password: "password")
end

2.times do
  Survey.create!(creator: User.find(rand(10)+1), title: Faker::Lorem.sentence, description: "None")
end

10.times do
  Question.create!(survey: Survey.find(rand(2)+1), content: Faker::Lorem.sentence)
end

100.times do
  Answer.create!(question: Question.find(rand(2)+1), content: Faker::Lorem.sentence)
end

10.times do
  Record.create!(answer: Answer.find(rand(2)+1), content: Faker::Lorem.sentence)
end

100.times do
  Response.create!(record: Record.find(rand(2)+1), answer: Answer.find(rand(2)+1))
end
