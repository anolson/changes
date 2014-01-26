class RenamePullRequestsToPatches < ActiveRecord::Migration
  def change
    rename_table :pull_requests, :patches
  end
end
