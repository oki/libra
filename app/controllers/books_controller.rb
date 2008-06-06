class BooksController < ApplicationController
  
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
    @book = Book.find(params[:id], :include => [:statuses])
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
  
end
