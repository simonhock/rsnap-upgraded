class AddOrderIntoChaptersMissions < ActiveRecord::Migration
  def change
    add_column :chapters_missions, :order, :integer
  end
end
