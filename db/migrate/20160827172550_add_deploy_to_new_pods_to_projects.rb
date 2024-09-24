# frozen_string_literal: true
class AddDeployToNewPodsToProjects < ActiveRecord::Migration[4.2]
  def change
    add_column :projects, :include_new_deploy_groups, :boolean, default: false, null: false
  end
end
