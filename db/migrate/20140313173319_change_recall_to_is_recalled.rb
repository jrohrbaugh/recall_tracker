class ChangeRecallToIsRecalled < ActiveRecord::Migration
  def change
    rename_column :items, :recalled, :is_recalled
  end
end
