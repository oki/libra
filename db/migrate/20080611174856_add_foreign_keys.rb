class AddForeignKeys < ActiveRecord::Migration
  extend MigrationHelpers

  def self.up
    fk :books, :user_id, :users

    fk :loans, :user_id, :users
    fk :loans, :book_id, :books

    fk :requests, :user_id, :users
    fk :requests, :book_id, :books

    fk :statuses, :book_id, :books
    fk :statuses, :loan_id, :loans
    fk :statuses, :request_id, :requests
  end

  def self.down
    drop_fk :books, :user_id

    drop_fk :loans, :user_id
    drop_fk :loans, :book_id

    drop_fk :requests, :user_id
    drop_fk :requests, :book_id

    drop_fk :statuses, :book_id
    drop_fk :statuses, :loan_id
    drop_fk :statuses, :request_id
  end
end
