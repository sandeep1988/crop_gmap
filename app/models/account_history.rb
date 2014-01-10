class AccountHistory < ActiveRecord::Base
  attr_accessible :credit_rating, :account_id
    belongs_to :account
    
end
