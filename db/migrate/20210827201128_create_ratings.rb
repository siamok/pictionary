class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :pin_id
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end
  end
end
