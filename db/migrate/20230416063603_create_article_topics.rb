class CreateArticleTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :article_topics do |t|
      t.integer :article_id
      t.integer :topic_id
      t.timestamps
    end
  end
end
