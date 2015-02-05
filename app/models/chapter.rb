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
  
  has_many :chapter_mission_manifests
  has_many :missions, through: :chapter_mission_manifests

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
      self.missions.present?
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
  
  def add_mission(mission, order=-1)
    manif = ChapterMissionManifest.new
    manif.mission_id = mission.id
    manif.chapter_id = self.id
    rec = ChapterMissionManifest.where(:chapter_id=>self.id).order("order"=> :asc).last
    curr_max_order = 0
    if order == 0
      order = order + 1
    end
    if rec.nil?
      curr_max_order = 0
    else
      curr_max_order = rec.order
    end
    if order != -1 and curr_max_order > order 
      i = curr_max_order
      while i >= order do
        temp_manif = ChapterMissionManifest.find_by(:chapter_id=>self.id,"order"=> i)
        temp_manif.order = temp_manif.order+1
        temp_manif.save
        i = i - 1
      end
      manif.order = order
    else
      manif.order = curr_max_order + 1
    end
    manif.save
  end
  
  def remove_mission(mission)
    manif = ChapterMissionManifest.find_by(:chapter_id=>self.id,:mission_id=>mission.id)
    order = manif.order
    manif.delete
    rec = ChapterMissionManifest.where(:chapter_id=>self.id).order("order"=> :asc).last
    if not rec.nil?
      ((order+1)..(rec.order)).each do |i|
        manif = ChapterMissionManifest.find_by(:chapter_id=>self.id,"order"=> i)
        manif.order = manif.order-1
        manif.save
      end
    end
  end
end
