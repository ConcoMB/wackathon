class AddOrganizerToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :organizer_id, :integer
  end
end
