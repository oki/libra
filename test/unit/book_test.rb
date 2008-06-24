require File.dirname(__FILE__) + '/../test_helper'

class BookTest < ActiveSupport::TestCase
  fixtures :users

  def test_create
    assert_equal "oki", users(:oki).login
  end

end
