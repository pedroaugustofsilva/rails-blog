# frozen_string_literal: true

# Constants
USER_EMAIL = 'admin@admin.dev'
USER_PASSWORD = '12345678'
USER_NAME = 'John'
NUMBER_OF_ARTICLES = 15

def generate_html_content
  Faker::Lorem.paragraphs(number: 10).map { |paragraph| "<p>#{paragraph}</p>" }.join(' ').html_safe
end

if Rails.env.development?

  user = User.create_with(password: USER_PASSWORD, name: USER_NAME)
             .find_or_create_by!(email: USER_EMAIL)

  article_data = Array.new(NUMBER_OF_ARTICLES) do
    {
      title: Faker::Lorem.sentence,
      content: generate_html_content,
      user_id: user.id
    }
  end

  Article.create!(article_data)
end
