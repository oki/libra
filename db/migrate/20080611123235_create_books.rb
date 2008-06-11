class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.integer :description_id
      t.integer :quantity
      t.string :author
      t.string :title
      t.string :isbn
      t.string :print
      t.text :description
      t.integer :version
      
      t.belongs_to :user
      t.belongs_to :owner

      t.timestamps
    end

  end

  def self.down
    drop_table :books
  end
end
