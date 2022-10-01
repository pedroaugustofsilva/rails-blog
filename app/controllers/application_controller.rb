# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_global_user

  private

  def set_global_user
    @global_user = User.last
  end
end
