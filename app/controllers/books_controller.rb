class BooksController < ApplicationController
  before_filter :login_required
  
  def index
    order = proper_order(params[:order])
    @books = Book.all(:include => :statuses, :order => order)
    
    
    respond_to do |format|
      format.html { render :partial => 'book_list', :collection => @books if request.xhr?}
      format.xml { render :xml => @books.to_xml }
    end
  end
  
  def new
    @book = Book.new
  end
  
  def create
    user = current_user
    @book = Book.new(params[:book])
    @book.user = user
    @book.save
    
    if @book.errors.empty?
      flash[:notice] = "Dodano książkę!"
      redirect_to :action => "show", :id => @book
    else
      render :action => :new
    end
  end
  
  
  def show
    # TODO owners
    @book = Book.find(params[:id], :include => [:statuses, :user, :loans, :requests])
    @loan_history = Loan.find_all_by_book_id(@book, :include => :user)
    @free = @book.statuses.dupa.count
    @av = @book.available?
    logger.debug "O TO CO?> #{@av.inspect}"
#  rescue
#    redirect_to :action => "index"
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    Book.update(params[:id], params[:book])
    @book = Book.find(params[:id])
    
    flash[:notice] = "Zaktualizowano"
    
    redirect_to :action => :show, :id => @book
  end
  
  def search
    order = proper_order(params[:order])
    conditions = ["title LIKE ? || author LIKE ?", "%#{params[:query][:keyword]}%", "%#{params[:query][:keyword]}%"] unless params[:query].nil?
    
    @books = Book.all(:include => :statuses, :conditions => conditions, :order => order)
    
    respond_to do |format|
      format.html { render :partial => 'book_list', :collection => @books if request.xhr?}
      format.xml { render :xml => @books.to_xml }
    end
  
    render :action => "index"
  end  

  def loaned
    @book = Book.loaned  
  end
  
  protected
  def proper_order(order)
    case order
    when 'title'
      'title'
    when 'author'
      'author'
    when 'available'
      'available'
    else
      'title'
    end
  end
  
end
