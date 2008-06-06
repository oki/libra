# == Schema Information
# Schema version: 20080605111852
#
# Table name: users
#
#  id         :integer(11)     not null, primary key
#  login      :string(255)     
#  created_at :datetime        
#  updated_at :datetime        
#

class User < ActiveRecord::Base
  has_many :descriptions
  has_many :loans
  has_many :requests
end
