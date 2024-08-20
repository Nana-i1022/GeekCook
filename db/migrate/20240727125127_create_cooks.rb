class CreateCooks < ActiveRecord::Migration[6.1]
  def change
    create_table :cooks do |t|   
      t.text :comment
      t.text :ingredient
      t.text :recipe

      t.timestamps
    end
  end
end
