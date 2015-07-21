class AddTechnologiesToProjects < ActiveRecord::Migration
  def change
    remove_column :users, :is_trama
    add_column :projects, :technologies, :string
  end
end
