class AddFieldsToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :website, :string
    add_column :projects, :pledging_ends_on, :date
  end
end
