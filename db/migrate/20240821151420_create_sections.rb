class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.text :text
      t.references :business_idea, null: false, foreign_key: true

      t.timestamps
    end
  end
end
