class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :role
      t.references :contract, foreign_key: true
      t.boolean :signed

      t.timestamps
    end
  end
end
