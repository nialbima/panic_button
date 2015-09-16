class CreateCompliments < ActiveRecord::Migration
  def change
    create_table :compliments do |t|
      t.integer :week
      t.text    :text

      t.timestamps null: false
    end
  end
end
