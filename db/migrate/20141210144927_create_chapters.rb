class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :description
      t.text :small_description
      t.string :youtube_link

      t.timestamps
    end
  end
end
