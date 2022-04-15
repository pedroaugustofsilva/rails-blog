# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  context 'Shoulda Matchers Asserts' do
    should validate_presence_of(:name)
    should validate_presence_of(:position)

    should validate_numericality_of(:position).only_integer

    should have_many(:articles)
  end
end
