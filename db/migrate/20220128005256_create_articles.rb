# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles, id: :uuid do |t|
      t.string :title
      t.string :slug
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
