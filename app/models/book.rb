# == Schema Information
# Schema version: 20080611174856
#
# Table name: books
#
#  id             :integer(11)     not null, primary key
#  description_id :integer(11)     
#  quantity       :integer(11)     
#  author         :string(255)     
#  title          :string(255)     
#  isbn           :string(255)     
#  print          :string(255)     
#  description    :text            
#  version        :integer(11)     
#  user_id        :integer(11)     
#  owner_id       :integer(11)     
#  created_at     :datetime        
#  updated_at     :datetime        
#

class Book < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner

  has_many :statuses
  has_many :loans, :through => :statuses
  has_many :requests

#  has_many :loans, :through => :statuses
#  has_many :requests, :through => :statuses

  named_scope :available, :include => :statuses, :conditions => [ 'statuses.loan_id IS NULL' ]
  named_scope :loaned, :include => :statuses, :conditions => ['statuses.loan_id IS NOT NULL']
  
  named_scope :loaned_by_user, lambda { |*args| { :include => :loans, :conditions => ["loans.user_id = ?", (args.first || 1)], :order => "loans.date_due_for_return"} }
  
  named_scope :due_for_return, :include => [ :statuses, :loans ], :conditions => ['statuses.loan_id IS NOT NULL']
  
  
  
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
 
  # Zwraca obkiet Loan dla ksiązki najwcześcniej dostępnej do wypożyczenia
  def first_free_for_loan
    current = nil
    statuses.each {|s|
      logger.debug ">> first_available"
      current = s.loan if current.nil? || (!s.loan.nil? && s.loan.date_due_for_return < current.date_due_for_return)
    }
    current
  end
  
  # TODO
  def loaned_by_user?(user)
    # KURWA JA PIERDOLE JEBANE RAILSY!!!
    # WAŁ JAKICH MAŁO
    #    logger.debug user.login
    #    logger.debug self.loans.count
    #    kurwa = nil
    #    logger.debug "KURWA> #{self.inspect}"
    #    if user && self.loans.count > 0
    #      logger.debug "KURWA> START"
    #      self.loans.each {|chuj|
    #        logger.debug "KURWA> #{chuj.inspect}"
    #      }
    #      logger.debug "KURWA> END"
    #    else
    #      nil
    #    end
    
    if user && self.loans.count > 0
      statuses.detect { |s|
        !s.loan.nil? && s.loan.user == user
      }      
    else
      nil
    end
  end
  
end
