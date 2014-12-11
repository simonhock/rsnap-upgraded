module ChapterHelper
  def chapter_missions_path(chapter)
    if :id 
      "/chapter_missions/#{chapter.id}/"
    else
      '/chapter_missions/'
    end
  end
end
