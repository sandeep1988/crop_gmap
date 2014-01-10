class AddsupplierIdToaccounts < ActiveRecord::Migration
   def change
    add_column :accounts, :supplier_id, :integer
  end
end
