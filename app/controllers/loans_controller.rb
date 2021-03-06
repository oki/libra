class LoansController < ApplicationController
  before_filter :login_required
  
  def destroy
    user = current_user
    @book = Book.find(params[:book_id])
    loan = Loan.find(params[:id])

    if loan.user == user
      ss = @book.statuses.detect { |s| s.loan == loan }
      ss.loan_id = nil
      ss.save
      loan.date_returned = Time.now
      loan.save
    end

    flash[:notice] = "książka oddana"

    redirect_to :controller => :books, :action => :show, :id => @book
  end

  # "wypozycza" ksiazke
  def create
    user = current_user
    @book = Book.find(params[:book_id])
    status = @book.available?

    loan = Loan.create(:user => user, :book => @book, :date_issued => Time.now, :date_due_for_return => Time.now + 3.weeks)
    status.loan = loan
    status.save

    flash[:notice] = "książka wypożyczona"

    redirect_to :controller => :books, :action => :show, :id => @book
  end

end
