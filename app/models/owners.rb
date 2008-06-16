# == Schema Information
# Schema version: 20080605111852
#
# Table name: owners
#
#  id         :integer(11)     not null, primary key
#  name       :string(255)     
#  created_at :datetime        
#  updated_at :datetime        
#

class Owners < ActiveRecord::Base
  has_many :books
end
