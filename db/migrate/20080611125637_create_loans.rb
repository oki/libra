class CreateLoans < ActiveRecord::Migration
  def self.up
    create_table :loans do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.datetime :date_issued
      t.datetime :date_due_for_return
      t.datetime :date_returned

      t.timestamps
    end
  end

  def self.down
    drop_table :loans
  end
end
