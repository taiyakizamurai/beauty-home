class ChangeDatatypeIsActiveOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :is_active, :integer
  end
end
