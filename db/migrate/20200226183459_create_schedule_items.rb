class CreateScheduleItems < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_items do |t|
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.string :name

      t.timestamps
    end
  end
end
