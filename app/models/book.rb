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

  has_many :loans, :through => :statuses
  has_many :requests, :through => :statuses
  
  validates_presence_of :quantity, :author, :title, :content, :user
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
  
  def first_available
    current = nil
    statuses.each {|s|
      current = s.loan if current.nil? || (!s.loan.nil? && s.loan.date_due_for_return > current.date_due_for_return)
    }
    current
  end
  
end
