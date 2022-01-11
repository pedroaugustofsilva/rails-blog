# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context 'Shoulda Matchers Asserts' do
    should validate_presence_of(:email)
    should validate_presence_of(:name)
  end
end
