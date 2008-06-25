require File.dirname(__FILE__) + '/../test_helper'

class BookTest < ActiveSupport::TestCase
  fixtures :users

  # assert_equal Book.count, 1
  # assert_equal "oki", users(:oki).login
  
  def test_create_ok
    b = helper_new_book

    assert b.save
    assert_equal Book.find_by_title("test create").id, b.id
  end

  def test_validate_author
    b = helper_new_book(:author => nil)
    assert !b.save
  end

  def test_validate_quantity
    b = helper_new_book(:quantity => nil)
    assert !b.save
  end

  def test_validate_title
    b = helper_new_book(:title => nil)
    assert !b.save
  end

  def test_validate_description
    b = helper_new_book(:description => nil)
    assert !b.save
  end

  def test_validate_user_presence
    b = helper_new_book(:user => nil)
    assert !b.save
    assert_equal ActiveRecord::Errors.default_error_messages[:blank], b.errors.on(:user)
  end

  def test_validate_user_associated
    b = helper_new_book(:user => User.new(:id => 100))
    assert !b.save
    assert_equal ActiveRecord::Errors.default_error_messages[:invalid], b.errors.on(:user)
  end

  def test_validate_quantity_numericality
    b = helper_new_book(:quantity => "abc")
    assert !b.save
    assert_equal ActiveRecord::Errors.default_error_messages[:not_a_number], b.errors.on(:quantity)
  end

  def test_after_create_add_statuses
    b = helper_new_book(:quantity => 3)
    assert b.save
    assert_equal Book.find(b.id), b
    assert_equal 3, Status.count(:conditions => ["book_id = ?",  b]), "Status * quantity"
  end

  def test_available_book
    assert_nil books(:available_book).available?
  end

  # TODO testy, dla wypozyczenia ksiazki, controller loans, create, wrzucic wyporzyczenie ksiazki w model
  def test_available_book_loaned
    true
  end

  def test_requested_book
    assert_nil books(:available_book).requested?
  end

  private

  def helper_new_book(attrs={})

    default = {
      :user => users(:oki), 
      :quantity => 1, 
      :description => "test create", 
      :author => "test author",
      :title => "test create"
    }
      
    Book.new(default.merge!(attrs))
  end

end
