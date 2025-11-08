class AddShowExportButtonsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :show_export_buttons, :boolean, default: true
  end
end
