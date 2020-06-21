# frozen_string_literal: true

class AddSsoImageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sso_image, :string
  end
end
