class AccountController < ApplicationController
  
  def login
    redirect_to :action => "/login"
  end
  
  def logout
    render :action => "/logout"
  end
  
  def index
    @user = current_user
    @books_for_return = Book.loaned.loaned_by_user(@user).count
    @book_for_return = Book.loaned.loaned_by_user(@user).first
  end
end
