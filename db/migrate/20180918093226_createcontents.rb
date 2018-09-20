class Createcontents < ActiveRecord::Migration[5.2]
  def change
  	create_table :contents do |t|
      t.string :tag
      t.text :value
      t.references :website
      t.timestamps
    end
  end
end
