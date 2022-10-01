# frozen_string_literal: true

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  context 'Shoulda Matchers Validations' do
    should validate_presence_of(:title)
    should validate_presence_of(:slug)
    should validate_presence_of(:content)
  end
end
