class RenamePatchesRawDiffToRaw < ActiveRecord::Migration
  def change
    change_table :patches do |t|
      t.rename(:raw_diff, :raw)
    end
  end
end
