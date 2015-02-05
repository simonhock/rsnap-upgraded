class AddUniquenessToChapterMissionsOrder < ActiveRecord::Migration
  def change
    add_index :chapters_missions, [:chapter_id, :order], :unique=>true
  end
end
