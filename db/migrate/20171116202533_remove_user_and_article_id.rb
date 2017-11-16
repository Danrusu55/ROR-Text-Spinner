class RemoveUserAndArticleId < ActiveRecord::Migration[5.0]
  def change
    remove_reference :articles, :user_id, index: true
    remove_reference :users, :article, index: true
  end
end
