# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
