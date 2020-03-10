class AddLinkToScheduleItem < ActiveRecord::Migration[6.0]
  def change
    add_column :schedule_items, :meeting_link, :string
  end
end
