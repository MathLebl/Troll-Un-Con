class AddColumnsToCons < ActiveRecord::Migration[6.0]
  def change
    add_column :cons, :first_name, :string, default: "Jean-François"
    add_column :cons, :postal, :string, default: "11 rue des arbres Nice"
  end
end
