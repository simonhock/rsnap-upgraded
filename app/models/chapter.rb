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
    if user
      if user.has_role?(:admin)
        return Chapter.all
      end
      num_solved_chapter = 0
      for chapter in Chapter.all
        break if not chapter.is_solved_by?(user)
        num_solved_chapter = num_solved_chapter + 1
      end
      Chapter.limit(num_solved_chapter + 1)
    else
      return Chapter.limit(1)
    end
  end
  
  def is_solved_by?(user)
    if user
      for mission in self.missions
        if not mission.is_solved_by?(user)
          return false
        end
      end
      if self.missions.empty?
        false
      else
        true
      end
    else
      false
    end
  end
  
  def get_disabled_from(user)
    if user
      solved = 0
      for mission in self.missions
        if mission.is_solved_by?(user)
          solved = solved + 1
        end
      end
      return solved + 1
    end
    1
  end

end
