class RenamePullRequestDiffToRawDiff < ActiveRecord::Migration
  def change
    change_table :pull_requests do |t|
      t.rename(:diff, :raw_diff)
    end
  end
end
