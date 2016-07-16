class DeleteTechs < ActiveRecord::Migration
  def change
    remove_column :projects, :technologies
  end
end
