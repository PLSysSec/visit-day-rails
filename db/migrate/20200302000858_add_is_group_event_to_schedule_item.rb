class AddIsGroupEventToScheduleItem < ActiveRecord::Migration[6.0]
  def change
    add_column :schedule_items, :is_group_event, :boolean, null: false, default: false
  end
end
