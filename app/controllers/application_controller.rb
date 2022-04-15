# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_global_user, :set_global_categories

  private

  def set_global_user
    @global_user = User.last
  end

  def set_global_categories
    @global_categories = Category.order(position: :asc, name: :asc).all
  end
end
