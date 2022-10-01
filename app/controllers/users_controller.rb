# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[update edit]
  before_action :set_user, only: %i[show edit update]

  def show; end

  def edit; end

  def update
    if @user.update(article_params)
      redirect_to users_url(@user), notice: I18n.t(:successfully_updated, name: User.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.first
  end

  def article_params
    params.require(:user).permit(:name, :email, :password)
  end
end
