module ChapterHelper
  def chapter_missions_path(chapter)
    if :id 
      "/chapter_missions/#{chapter.id}/"
    else
      '/chapter_missions/'
    end
  end
  def add_chapter_missions_path(chapter)
    if :id
      "/chapters/#{chapter.id}/add_mission/"
    else
      '/chapters/'
    end
  end
end
