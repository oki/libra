# == Schema Information
# Schema version: 20080611174856
#
# Table name: requests
#
#  id          :integer(11)     not null, primary key
#  user_id     :integer(11)     
#  book_id     :integer(11)     
#  date_issued :datetime        
#  created_at  :datetime        
#  updated_at  :datetime        
#

class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  has_many :statuses
end
