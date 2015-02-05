class DropChaptersMissions < ActiveRecord::Migration
  def change
    drop_table :chapters_missions
  end
end
