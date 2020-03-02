class AddLocationToScheduleItem < ActiveRecord::Migration[6.0]
  def change
    add_column :schedule_items, :location, :string
  end
end
