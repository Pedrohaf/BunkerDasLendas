class AddNametoTopics < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :name, :string
  end
end
