# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get edit' do
    get edit_users_path
    assert_response :redirect
  end
end
