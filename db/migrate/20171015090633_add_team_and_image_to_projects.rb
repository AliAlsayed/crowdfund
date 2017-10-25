class AddTeamAndImageToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :team_members, :string
    add_column :projects, :image_file_name, :string, default: ""
  end
end
