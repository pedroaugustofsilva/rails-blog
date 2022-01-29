# frozen_string_literal: true

user = User.create_with(password: '12345678', name: 'Pedro').find_or_create_by(email: 'admin@admin.dev')

15.times do
  Article.create(title: Faker::Lorem.sentence,
                 content: Faker::Lorem.paragraphs.map { |c| "<p>#{c}</p>" }.join(' '),
                 user_id: user.id)
end
