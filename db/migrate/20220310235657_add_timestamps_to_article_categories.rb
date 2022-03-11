class AddTimestampsToArticleCategories < ActiveRecord::Migration[6.1]
  def change
    add_timestamps :article_categories, default: DateTime.now
    change_column_default :article_categories, :created_at, from: DateTime.now, to: nil
    change_column_default :article_categories, :updated_at, from: DateTime.now, to: nil
  end
end
