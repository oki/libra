class BooksController < ApplicationController
  before_filter :login_required
  
  def index
    @books = Book.all(:include => :statuses)
    
    respond_to do |format|
      format.html { render :partial => 'book_list', :collection => @books if request.xhr?}
      format.xml { render :xml => @books.to_xml }
    end
  end
  
  def new
    @book = Book.new
  end
  
  def create
    user = User.first
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
    @user = User.first
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
    conditions = ["title LIKE ?", "%#{params[:query][:keyword]}%"] unless params[:query].nil?
    
    @books = Book.all(:include => :statuses, :conditions => conditions)
    
    respond_to do |format|
      format.html { render :partial => 'book_list', :collection => @books if request.xhr?}
      format.xml { render :xml => @books.to_xml }
    end
  
    render :action => "index"
  end  

  def loaned
    @book = Book.loaned  
  end
  
  
end
