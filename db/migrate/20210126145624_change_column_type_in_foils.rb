class ChangeColumnTypeInFoils < ActiveRecord::Migration[6.0]
  def change
    remove_column :foils, :img_link
    add_column :foils, :img_fetch, :boolean, default: false
  end
end
