class CreateGroupMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :group_meetings do |t|
      t.references :schedule_item, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
