class AddColumnToEmbassy < ActiveRecord::Migration[5.0]
  def change
    add_column :embassies, :abroad, :string
  end
end
