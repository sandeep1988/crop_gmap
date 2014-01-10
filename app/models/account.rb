class Account < ActiveRecord::Base
  attr_accessible :account_number , :supplier_id
  belongs_to :supplier
  has_one :account_history
end
