class CreateJoinTablePeopleScheduleItem < ActiveRecord::Migration[6.0]
  def change
    create_join_table :people, :schedule_items do |t|
      t.index [:schedule_item_id, :person_id], unique: true,
        # Autogenerated name is too long for SQLite so we pick a manual one :(
        name: "schedule_item_id_person_join_index"
    end
  end
end