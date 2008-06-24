# == Schema Information
# Schema version: 20080611174856
#
# Table name: users
#
#  id                        :integer(11)     not null, primary key
#  login                     :string(255)     
#  email                     :string(255)     
#  salt                      :string(40)      
#  remember_token            :string(255)     
#  remember_token_expires_at :datetime        
#  created_at                :datetime        
#  updated_at                :datetime        
#

require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  # include Authentication::ByPassword
  include Authentication::ByCookieToken
  
  has_many :loans

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login,    :case_sensitive => false
  validates_format_of       :login,    :with => RE_LOGIN_OK, :message => MSG_LOGIN_BAD

#  validates_format_of       :name,     :with => RE_NAME_OK,  :message => MSG_NAME_BAD, :allow_nil => true
#  validates_length_of       :name,     :maximum => 100

#  validates_presence_of     :email
#  validates_length_of       :email,    :within => 6..100 #r@a.wk
#  validates_uniqueness_of   :email,    :case_sensitive => false
#  validates_format_of       :email,    :with => RE_EMAIL_OK, :message => MSG_EMAIL_BAD

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  # TODO
  attr_accessible :login, :email, :password



  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    u = find_by_login(login) # need to get the salt
    # 
    # TODO odhaszowac :)
#     u && u.authenticated?(password) ? u : nil
    u
  end

  protected
    

end
