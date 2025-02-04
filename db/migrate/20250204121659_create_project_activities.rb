class CreateProjectActivities < ActiveRecord::Migration[7.2]
  def change
    create_table :project_activities do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :activity_type
      t.jsonb :additional_data, default: {}

      t.timestamps
    end
  end
end
