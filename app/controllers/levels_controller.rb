class LevelsController < ApplicationController
  before_action :set_level, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "Spartanfox", password: "toidzBlock", except: [:upload, :index, :show]
  # GET /levels
  # GET /levels.json
  def index
    @levels = Level.all
  end

  # GET /levels/1
  # GET /levels/1.json
  def show
    @highscores = @level.highscores.sort{|a,b| b.score.to_i <=> a.score.to_i}
  end

  # GET /levels/new
  def new
    @level = Level.new
  end

  # GET /levels/1/edit
  def edit
  end

  def upload
    @level = Level.find_by_name(params[:level_id])
    @highscore = @level.highscores.new(highscore_params)
    @highscores = @level.highscores
    @highscores.each do |highscore|
      if highscore.name.downcase == @highscore.name.downcase
        if @highscore.score >= highscore.score
          highscore.update(highscore_params)
          @highscore = highscore
          break
        else
          @highscore.score = nil
          break
        end
      end
    end
    if !!@highscore.score
      @highscore.save
    end
    redirect_to level_highscores_path(Level.find(@highscore.level_id), format: :json)
  end

  # POST /levels
  # POST /levels.json
  def create
    @level = Level.new(level_params)

    respond_to do |format|
      if @level.save
        format.html { redirect_to @level, notice: 'Level was successfully created.' }
        format.json { render :show, status: :created, location: @level }
      else
        format.html { render :new }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /levels/1
  # PATCH/PUT /levels/1.json
  def update
    respond_to do |format|
      if @level.update(level_params)
        format.html { redirect_to @level, notice: 'Level was successfully updated.' }
        format.json { render :show, status: :ok, location: @level }
      else
        format.html { render :edit }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /levels/1
  # DELETE /levels/1.json
  def destroy
    @level.destroy
    respond_to do |format|
      format.html { redirect_to levels_url, notice: 'Level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level
      @level = Level.find_by_name(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_params
      params.require(:level).permit(:name, :gamemode, :image_url)
    end

    def highscore_params
      params.require(:highscore).permit(:name, :time, :score)
    end
end
