class CreateDescriptions < ActiveRecord::Migration
  def self.up
    create_table :descriptions do |t|
      t.integer :user_id
      t.string :author
      t.string :title
      t.string :isbn
      t.string :print
      t.text :content
      t.integer :version

      t.timestamps
    end
  end

  def self.down
    drop_table :descriptions
  end
end
