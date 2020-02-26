class MoveGroupsFromStudentToGroup < ActiveRecord::Migration[6.0]
  def up 
    rename_column :students, :group, :group_name
    add_reference :students, :group, foreign_key: true

    Student.all.each do |s|
      group = Group.find_or_create_by(name: s.group_name)
      s.group_id = group.id
      s.save!
    end

    remove_column :students, :group_name
  end
end
