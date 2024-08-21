class CreateBusinessIdeas < ActiveRecord::Migration[7.0]
  def change
    create_table :business_ideas do |t|
      t.string :name
      t.integer :average_revenue
      t.integer :average_cost_to_start
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
