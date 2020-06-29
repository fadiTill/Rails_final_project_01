class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string  :name
      t.string  :phone_number
      t.string  :adress
      t.string  :email
      t.string  :time_line 
      t.text    :comment
  
        t.timestamps
    end
  end
end
