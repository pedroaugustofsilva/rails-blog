# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, :slug, :content, presence: true
  has_rich_text :content

  belongs_to :user
end
