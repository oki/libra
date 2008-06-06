class DescriptionsController < ApplicationController
  def index
    redirect_to :controller => "books"
  end
  
  def create
    @description = Description.new(params[:description])
    @description.save
    
    if @description.errors.empty?
      @book = Book.new
      @book.description = @description
      render :update do |page|
        page.replace_html 'BookForm', :partial => 'books/new_book'
      end
    else
      render :update do |page|
        page.replace_html 'BookForm', :partial => 'new_description'
      end
    end
  end
end
