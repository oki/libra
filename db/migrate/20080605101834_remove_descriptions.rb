class RemoveDescriptions < ActiveRecord::Migration
  def self.up
    drop_table :descriptions
  end

  def self.down
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
end
