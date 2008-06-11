class Requests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.belongs_to  :user
      t.belongs_to :book
      t.datetime :date_issued
      
      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
