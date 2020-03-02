class ChangeIsGroupEventToIsGlobal < ActiveRecord::Migration[6.0]
  def change
    rename_column :schedule_items, :is_group_event, :is_global
  end
end
