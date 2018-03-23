class CreatePipes < ActiveRecord::Migration[5.2]
  def change
    create_table :pipes do |t|
      t.integer :ext_id
      t.string :name
      t.references :organization
      t.timestamps
    end
  end
end
