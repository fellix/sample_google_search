class CreateSearchItems < ActiveRecord::Migration
  def up
    create_table :search_items do |t|
      t.string :title
      t.string :url
      t.text :description
      t.integer :position
      t.string :keyword
    end
  end
  
  def down
    drop_table :search_items
  end
end