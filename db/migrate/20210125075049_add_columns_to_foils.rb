class AddColumnsToFoils < ActiveRecord::Migration[6.0]
  def change
    change_table :foils do |t|
      t.string :short_description
      t.string :url
      t.string :img_link
    end
  end
end
