class CreateFields < ActiveRecord::Migration[5.2]
  def change
    create_table :fields do |t|
      t.string :name
      t.string :content
      t.references :object, polymorphic: true
      t.timestamps
    end
  end
end
