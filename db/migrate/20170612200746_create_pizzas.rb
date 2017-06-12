class CreatePizzas < ActiveRecord::Migration[5.0]
  def change
    create_table :pizzas do |t|
      t.date :pizza_date, null: false
      t.text :pizza_type
      t.timestamps
    end
  end
end
