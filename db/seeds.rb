require "faker"

# This is the creation of a test user
test_user = User.create(name: "Test",
                       email: "test@test.com",
                    password: "aaaa")

other_user = User.create(name: "Other",
                        email: "other@test.com",
                     password: "a")


test_survey_1 = Survey.create(creator: test_user,
                                title: "Test Survey Title 1",
                          description: "This is the description for the test survey 1")
test_question_1 = Question.create(survey: test_survey_1,
                                 content: "This is the content for the test question 1")
test_answer_1 = Answer.create(question: test_question_1,
                               content: "This is the content for test answer 1")
test_answer_2 = Answer.create(question: test_question_1,
                               content: "This is the content for test answer 2")

test_survey_2 = Survey.create(creator: other_user,
                                title: "Test Survey Title 2",
                          description: "This is the description for the test survey 2")
test_question_2 = Question.create(survey: test_survey_2,
                                 content: "This is the content for the test question 2")
test_answer_3 = Answer.create(question: test_question_2,
                               content: "This is the content for test answer 3")
test_answer_4 = Answer.create(question: test_question_2,
                               content: "This is the content for test answer 4")
test_record = Record.create(respondent: test_user,
                                survey: test_survey_2)
test_response_1 = Response.create(record: test_record,
                                  answer: test_answer_3)
test_response_2 = Response.create(record: test_record,
                                  answer: test_answer_4)


# Below is the creation of extra fake data
# None of it will be populated with the test user data
10.times do
  User.create(name: Faker::Name.name,
             email: Faker::Internet.email,
          password: "password")
end

10.times do
  Survey.create(creator: User.find(rand(User.count-1)+2),
                  title: Faker::Lorem.sentence,
            description: Faker::Lorem.paragraph)
end

10.times do
  Question.create(survey: Survey.find(rand(Survey.count-1)+2),
                 content: Faker::Lorem.sentence)
end

100.times do
  Answer.create(question: Question.find(rand(Question.count-1)+2),
                 content: Faker::Lorem.sentence)
end

10.times do
  Record.create(respondent: User.find(rand(User.count-1)+2),
                    survey: Survey.find(rand(Survey.count-1)+2))
end

100.times do
  Response.create(record: Record.find(rand(Record.count-1)+2),
                  answer: Answer.create(question: Question.find(rand(Question.count-1)+2),
                                         content: Faker::Lorem.sentence))
end
