class AccountController < ApplicationController
  before_filter :login_required
  
  def login
    redirect_to :action => "/login"
  end
  
  def logout
    render :action => "/logout"
  end
  
  def index
    @user = current_user
    @books_for_return = Book.loaned_by_user(@user, :include => [:user, :loans])
#    Book.loaned_by_user(1).first.loans.first.date_due_for_return
    @book = @books_for_return[0] if !@books_for_return.empty?
  end
end
