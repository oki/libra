class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.belongs_to :book
      t.belongs_to :loan
      t.belongs_to :request

      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end
