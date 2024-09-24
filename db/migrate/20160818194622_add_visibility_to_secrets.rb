# frozen_string_literal: true
class AddVisibilityToSecrets < ActiveRecord::Migration[4.2]
  def change
    add_column :secrets, :visible, :boolean, default: false, null: false
  end
end
