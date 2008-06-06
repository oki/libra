class AddDescriptionFieldsToBook < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.string :author
      t.string :title
      t.string :isbn
      t.string :print
      t.text :content
      t.integer :version
    end
  end

  def self.down
    change_table :books do |t|
      t.remove_column :author
      t.remove_column :title
      t.remove_column :isbn
      t.remove_column :print
      t.remove_column :content
      t.remove_column :version
    end
  end
end
