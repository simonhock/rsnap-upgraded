class SortChapterMissionsController < ApplicationController
  authorize_actions_for Chapter
  before_filter :authenticate_user!

  def update
    @chapter = Chapter.find(params[:id])
    @chapter.update(chapter_missions_params)
    render nothing: true # action called via ajax
  end

  private
    def chapter_missions_params
      params.require(:thing).permit(:chapter_missions_order_position)
    end
end

