class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.integer :book_id
      t.integer :loan_id
      t.integer :request_id

      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end
