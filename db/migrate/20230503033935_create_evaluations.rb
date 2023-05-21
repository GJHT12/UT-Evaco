class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.string :teacher_name
      t.string :class_name
      t.integer :evaluation,default: 0, null: false, limit: 1
      t.integer :easiness,default: 0, null: false, limit: 1
      t.integer :expectation,default: 0, null: false, limit: 1
      t.text :comment
      t.integer :user_id

      t.timestamps
    end
  end
end