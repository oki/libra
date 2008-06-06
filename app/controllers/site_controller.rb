class SiteController < ApplicationController

  def index
    @statuses = Status.all(:include => :book)
  end
    
end
