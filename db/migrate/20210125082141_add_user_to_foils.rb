class AddUserToFoils < ActiveRecord::Migration[6.0]
  def change
    add_reference :foils, :user, null: false, foreign_key: true
  end
end
