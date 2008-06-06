class AddOwnerToBook < ActiveRecord::Migration
  def self.up
    change_table :books  do |t|
      t.belongs_to :owner
    end
  end

  def self.down
    change_table :books do |t|
      t.remove_belongs_to :owner
    end
  end
end
