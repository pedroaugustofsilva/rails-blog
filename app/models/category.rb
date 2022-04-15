# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, :position, presence: true
  validates :position, numericality: { only_integer: true }

  has_many :articles, dependent: :nullify
end
