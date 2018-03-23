class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.integer :ext_id
      t.string :name
      t.timestamps
    end
  end
end
