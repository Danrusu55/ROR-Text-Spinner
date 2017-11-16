class AddColumnToOwnership < ActiveRecord::Migration[5.0]
  def change
    add_column :ownerships, :user_id, :integer
    add_column :ownerships, :article_id, :integer
  end
end
