# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, :slug, :content, presence: true
  has_rich_text :content

  belongs_to :user

  before_validation :set_slug

  private

  def set_slug
    return if slug.present? || title.blank?

    possible_slug = title.downcase.gsub(/ +\d+/, '-')

    while Article.where(slug: possible_slug).count.positive?
      possible_slug = title.downcase.gsub(/ +\d+/, '-') + "-#{SecureRandom.hex[0..2]}"
    end

    self.slug = possible_slug
  end
end
