class RemoveShowExportButtonsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :show_export_buttons, :boolean
  end
end
