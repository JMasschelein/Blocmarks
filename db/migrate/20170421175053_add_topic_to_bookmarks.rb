class AddTopicToBookmarks < ActiveRecord::Migration[5.0]
  def change
    add_column :bookmarks, :topic_id, :integer
    add_index :bookmarks, :topic_id
  end
end
