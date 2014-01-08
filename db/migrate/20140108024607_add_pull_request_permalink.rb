class AddPullRequestPermalink < ActiveRecord::Migration
  def change
    change_table :pull_requests do |t|
      t.string :permalink
    end
  end
end
