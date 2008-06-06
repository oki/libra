class UpdateBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      
      t.belongs_to :user
    end
    remove_column(:books, :description_id)
  end

  def self.down
    change_table :books do |t|
      t.integer :description_id
      
    end
    remove_column(:books, :user_id)
  end
end
