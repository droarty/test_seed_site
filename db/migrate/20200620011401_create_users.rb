class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :sso_token
      t.string :sso_refresh_token
      t.string :sso_type

      t.timestamps
    end
  end
end
