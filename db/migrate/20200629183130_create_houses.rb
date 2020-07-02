class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :adress
      t.string :comment
      
    end
  end
end
