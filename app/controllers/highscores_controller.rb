class HighscoresController < ApplicationController
  before_action :set_highscore, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "Spartanfox", password: "toidzBlock", except: [:index, :show]
  # GET /highscores
  # GET /highscores.json
  def index
    @level = Level.find_by_name(params[:level_id])
    @highscores = @level.highscores
    @start = 0
    @end = 10
    if params.has_key?(:page)
      @start = params[:page].to_i
    end
    @highscores = @highscores.sort{|a,b| b.score.to_i <=> a.score.to_i}
    @highscores = @highscores[@start,@end]
  end

  # GET /highscores/1
  # GET /highscores/1.json
  def show

  end

  # GET /highscores/new
  def new
    @level = Level.find_by_name(params[:level_id])
    @highscore = @level.highscores.new
  end

  # GET /highscores/1/edit
  def edit
    @level = Level.find_by_name(params[:level_id])
  end



  # POST /highscores
  # POST /highscores.json
  def create
    @level = Level.find_by_name(params[:level_id])
    @highscore = @level.highscores.new(highscore_params)
    @highscores = @level.highscores
    @highscores.each do |highscore|
      if highscore.name == @highscore.name
        if @highscore.score > highscore.score
          highscore.update(highscore_params)
          @highscore = highscore
        else
          @highscore.score = nil
          break
        end
      end
    end
    if !!@highscore.score
      respond_to do |format|
        if @highscore.save
          format.html { redirect_to level_highscores_path(Level.find(@highscore.level_id), format: :json), notice: 'Highscore was successfully created.' }
          format.json { render :show, status: :created, location: @highscore }
        else
          format.html { render :new }
          format.json { render json: @highscore.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to level_highscores_path(Level.find(@highscore.level_id), format: :json)
    end
  end

  # PATCH/PUT /highscores/1
  # PATCH/PUT /highscores/1.json
  def update
    respond_to do |format|
      if @highscore.update(highscore_params)
        format.html { redirect_to level_highscores_path(Level.find(@highscore.level_id), format: :json), notice: 'Highscore was successfully updated.' }
        format.json { render :show, status: :ok, location: @highscore }
      else
        format.html { render :edit }
        format.json { render json: @highscore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /highscores/1
  # DELETE /highscores/1.json
  def destroy
    @highscore.destroy
    respond_to do |format|
      format.html { redirect_to level_path(Level.find_by_name(params[:level_id])), notice: 'Highscore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_highscore
      @level = Level.find_by_name(params[:level_id])
      @highscore = @level.highscores.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def highscore_params
      params.require(:highscore).permit(:name, :time, :score)
    end
end
