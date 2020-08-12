class ChangeDefaultForConColumns < ActiveRecord::Migration[6.0]
  def change
    change_column_default :cons, :email, "mailperso@mail.com"
    change_column_default :cons, :phone, "0612345789"
    change_column_default :cons, :name, "Martin"

  end
end
