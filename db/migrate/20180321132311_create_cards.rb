class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :ext_id
      t.string :name
      t.references :phase
      t.datetime :due_date
      t.timestamps
    end
  end
end
