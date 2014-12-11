# == Schema Information
#
# Table name: chapters
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  description       :text
#  small_description :text
#  youtube_link      :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Chapter < ActiveRecord::Base
  include Authority::Abilities
  has_and_belongs_to_many :missions

  def self.visible_for(user)
    Chapter.all
  end
  
  def is_solved_by?(user)
    if user
      solved = true
      for mission in self.missions
        solved = solved and mission.is_solved_by?(user)
      end
      solved
    else
      false
    end
  end

end
