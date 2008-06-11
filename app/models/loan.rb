# == Schema Information
# Schema version: 20080611174856
#
# Table name: loans
#
#  id                  :integer(11)     not null, primary key
#  user_id             :integer(11)     
#  book_id             :integer(11)     
#  date_issued         :datetime        
#  date_due_for_return :datetime        
#  date_returned       :datetime        
#  created_at          :datetime        
#  updated_at          :datetime        
#

class Loan < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  has_many :statuses
  
  validates_presence_of  :date_due_for_return
end
