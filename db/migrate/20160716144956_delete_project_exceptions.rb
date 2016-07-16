class DeleteProjectExceptions < ActiveRecord::Migration
  def change
    drop_table :project_exceptions
  end
end
