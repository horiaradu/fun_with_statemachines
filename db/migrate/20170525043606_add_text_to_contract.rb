class AddTextToContract < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :text, :string
  end
end
