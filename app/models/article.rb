# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, :slug, :content, presence: true
  has_rich_text :content

  belongs_to :user
  belongs_to :category, optional: true

  before_validation :set_slug

  private

  def set_slug
    return if slug.present? || title.blank?

    self.slug = generate_slug
  end

  def generate_slug
    possible_slug = title.downcase.strip.gsub(/\s+/, '-')

    while Article.where(slug: possible_slug).count.positive?
      possible_slug = title.downcase.strip.gsub(/\s+/, '-') + "-#{SecureRandom.hex[0..2]}"
    end

    possible_slug
  end
end
