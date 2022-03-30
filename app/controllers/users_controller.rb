# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[update edit]
  before_action :set_user, only: %i[show edit update]

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @user.update(article_params)
        format.html { redirect_to users_url(@user), notice: 'Article was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.first
  end

  def article_params
    params.require(:user).permit(:name, :email, :photo, :password)
  end
end
