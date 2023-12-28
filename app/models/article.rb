# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates :title, :slug, :content, presence: true

  before_validation :set_slug

  private

  def set_slug
    self.slug ||= title.to_s.parameterize
  end
end
