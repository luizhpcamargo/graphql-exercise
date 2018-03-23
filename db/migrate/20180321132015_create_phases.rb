class CreatePhases < ActiveRecord::Migration[5.2]
  def change
    create_table :phases do |t|
      t.integer :ext_id
      t.string :name
      t.references :pipe
      t.timestamps
    end
  end
end
