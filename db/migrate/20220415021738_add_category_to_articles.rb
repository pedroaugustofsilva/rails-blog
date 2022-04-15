# frozen_string_literal: true

class AddCategoryToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :category, type: :uuid, foreign_key: { on_delete: :nullify, on_update: :cascade }
  end
end
