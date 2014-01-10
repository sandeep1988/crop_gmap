class AddaccountIdToaccounthistory < ActiveRecord::Migration
  def change
    add_column :account_histories, :account_id, :integer
  end
end
