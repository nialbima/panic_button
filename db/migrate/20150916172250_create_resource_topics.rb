class CreateResourceTopics < ActiveRecord::Migration
  def change
    create_table :resource_topics do |t|
      t.references :resource, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
