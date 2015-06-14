class ChangeUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_trama, :boolean
    add_reference :users, :project
  end
end
