2.times do
  user = User.create(username: Faker::FunnyName.name, email: Faker::Internet.email, password: Faker::Internet.password(max_length = 16))
  2.times do
    user.poems.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph)
  end
end
