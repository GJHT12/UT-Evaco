class CreateOpinions < ActiveRecord::Migration[5.2]
  def change
    create_table :opinions do |t|
      t.text :opinion
      t.integer :user_id
      t.integer :evaluation_id

      t.timestamps
    end
  end
end
