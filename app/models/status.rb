# == Schema Information
# Schema version: 20080605111852
#
# Table name: statuses
#
#  id         :integer(11)     not null, primary key
#  book_id    :integer(11)     
#  loan_id    :integer(11)     
#  request_id :integer(11)     
#  created_at :datetime        
#  updated_at :datetime        
#

class Status < ActiveRecord::Base
  belongs_to :book
  belongs_to :loan
  belongs_to :request
end
