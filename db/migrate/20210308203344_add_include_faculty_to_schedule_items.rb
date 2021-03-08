class AddIncludeFacultyToScheduleItems < ActiveRecord::Migration[6.0]
  def change
    add_column :schedule_items, :include_faculty, :boolean, null: false, default: false
  end
end
