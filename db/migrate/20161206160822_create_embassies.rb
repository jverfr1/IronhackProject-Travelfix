class CreateEmbassies < ActiveRecord::Migration[5.0]
  def change
    create_table :embassies do |t|
      t.string :name
      t.string :location_abroad
      t.string :title
      t.string :link
      t.text   :visa_info

      t.timestamps
    end
  end
end
