class FileMissionsController < ApplicationController
  authorize_actions_for FileMission
  before_action :set_file_mission, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except=>[:show, :index]

  def index
    @file_missions = FileMission.all
  end

  def show
  end

  def new
    @file_mission = FileMission.new
  end

  def edit
  end

  def create
    @file_mission = FileMission.new(file_mission_params)

    if @file_mission.save
      redirect_to @file_mission, notice: 'File mission was successfully created.'
    else
      render :new
    end
  end

  def update
    if @file_mission.update(file_mission_params)
      redirect_to @file_mission, notice: 'File mission was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @file_mission.destroy
    redirect_to file_missions_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_mission
      @file_mission = FileMission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_mission_params
      if params[:file_mission]
        params.require(:file_mission).permit(:mission_id, :file)
      else
        params.permit(:file)
      end
    end
end
