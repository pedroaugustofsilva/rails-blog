# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_one_attached :photo

  validates :email, :name, presence: true
end
