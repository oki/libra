# == Schema Information
# Schema version: 20080605111852
#
# Table name: books
#
#  id         :integer(11)     not null, primary key
#  quantity   :integer(11)     
#  created_at :datetime        
#  updated_at :datetime        
#  owner_id   :integer(11)     
#  author     :string(255)     
#  title      :string(255)     
#  isbn       :string(255)     
#  print      :string(255)     
#  content    :text            
#  version    :integer(11)     
#  user_id    :integer(11)     
#

class Book < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner
  has_many :statuses
  has_many :loans
  has_many :requests

#  has_many :loans, :through => :statuses
#  has_many :requests, :through => :statuses

  named_scope :available, :include => :statuses, :conditions => { 'statuses.loan_id' => nil }
  named_scope :loaned, :include => :statuses, :conditions => { 'statuses.loan_id' => !nil }
  
  # 
  # select l.id "loan_id",b.id, b.title,s.updated_at, l.date_due_for_return 
  # from books b 
  # inner join statuses s on s.book_id = b.id 
  # inner join loans l on l.book_id = b.id  
  # where b.id = 1 
  # order by s.updated_at 
  # limit 1;
  
  
#  named_scope :xxx, :include => [:statuses, :loans], :conditions => { 'books.id = '}
  
  validates_presence_of :quantity, :author, :title, :description, :user
  validates_associated :user
  validates_numericality_of :quantity

  def after_create
    logger.debug ">> TUTAJ"
    quantity.times do
      Status.create(:book => self)
    end
  rescue
    logger.debug ">> o w morde :-/"
  end
 
  # gdy ksiazka jest dostepne do wypozyczenia, zwraca odpowidnie rekord statusu
  # w przeciwnym wypadku zwraca nil
  def available?
    statuses.detect { |s| s.loan.nil? }
  end
  
  def requested?
    statuses.detect { |s| !s.request.nil? }
    
    
  end
 
#  named_scope 
  def first_available
    current = nil
    statuses.each {|s|
      logger.debug ">> first_available"
      current = s.loan if current.nil? || (!s.loan.nil? && s.loan.date_due_for_return < current.date_due_for_return)
    }
    current
  end
  
end
