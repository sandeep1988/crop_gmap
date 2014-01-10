class Supplier < ActiveRecord::Base
  attr_accessible :name
  has_one :account
  has_one :account_history, through: :account
end
