class CreatePersonalMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_meetings do |t|
      t.references :schedule_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
