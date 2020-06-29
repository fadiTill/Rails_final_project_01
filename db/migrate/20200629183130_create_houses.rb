class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :adress
      t.string :comment
      t.integer :user_id
      t.integer :guest_id
    end
  end
end
