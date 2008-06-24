class RemovedescriptionIddFromBooks < ActiveRecord::Migration

  def self.up
    change_table :books do |t|
      t.remove :description_id
    end
  end 

  def self.down
    change_table :books do |t|
      t.integer :description_id
    end
  end
end
