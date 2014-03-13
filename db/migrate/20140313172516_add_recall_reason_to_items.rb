class AddRecallReasonToItems < ActiveRecord::Migration
  def change
    add_column :items, :recall_reason, :string
  end
end
