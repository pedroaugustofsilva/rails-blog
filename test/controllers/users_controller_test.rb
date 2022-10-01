# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
  end

  test "shouldn't get edit if is not logged" do
    sign_out users(:admin)
    get edit_users_path
    assert_response :redirect
  end

  test 'should get edit' do
    get edit_users_path
    assert_response :success
  end

  test 'should update the user' do
    user = users(:admin)
    new_name = 'Mrs Been'
    put users_path, params: { user: { name: new_name } }
    user.reload
    assert_equal new_name, user.name
  end

  test 'should not update the user if the name is empty' do
    user = users(:admin)
    new_name = nil
    put users_path, params: { user: { name: new_name } }
    user.reload
    assert_equal 422, response.status
  end
end
