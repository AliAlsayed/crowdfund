class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :projects, :traget_pledge_amount, :target_pledge_amount
  end
end
