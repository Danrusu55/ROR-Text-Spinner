class AddUserToArticles < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :article, foreign_key: true
  end
end