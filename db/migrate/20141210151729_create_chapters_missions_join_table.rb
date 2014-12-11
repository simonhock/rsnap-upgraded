class CreateChaptersMissionsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :chapters_missions, :id => false do |t|
      t.integer :chapter_id
      t.integer :mission_id
    end

    add_index :chapters_missions, [:chapter_id, :mission_id]
  end

  def self.down
    drop_table :chapters_missions
  end
end
