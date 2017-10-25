class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.decimal :traget_pledge_amount

      t.timestamps
    end
  end
end
