class CreateProjectException < ActiveRecord::Migration
  def change
    create_table :project_exceptions do |t|
      t.text :description
      t.references :user
      t.references :project
    end
  end
end
