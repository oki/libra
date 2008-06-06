class BooksController < ApplicationController
  
  def index
    @books = Book.all(:include => :statuses)
    
    respond_to do |format|
      format.html
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
  
end
