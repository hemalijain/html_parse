class Createwebsites < ActiveRecord::Migration[5.2]
  def change
  	create_table :websites do |t|
      t.string :url
      t.timestamps
    end

  end
end
