class CreateCons < ActiveRecord::Migration[6.0]
  def change
    create_table :cons do |t|
      t.string :email
      t.string :phone
      t.string :name
      t.integer :category

      t.timestamps
    end
  end
end
