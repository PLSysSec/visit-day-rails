class AddKindToPerson < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :kind, :integer
  end
end
