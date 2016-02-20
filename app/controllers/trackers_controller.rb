class TrackersController < ApplicationController
  before_action :set_tracker, only: [:show, :edit, :update, :destroy]

  # GET /trackers
  # GET /trackers.json
  def index
    @trackers = Tracker.all
  end

  # GET /trackers/1
  # GET /trackers/1.json
  def show
  end

  # GET /trackers/new
  def new
    @tracker = Tracker.new
  end

  # GET /trackers/1/edit
  def edit
  end

  # POST /trackers
  # POST /trackers.json
  def create
    @tracker = Tracker.new()
    @tracker.period = params[:period]
    @tracker.user_id = @current_user
    @user = User.find(@current_user)

    respond_to do |format|
      if @tracker.save
        
        @fields = [Field.new(), Field.new(), Field.new()]
        @fields[0].title = "Progress" 
        @fields[1].title = "Plan"
        @fields[2].title = "Problems"
         
        @fields.each do |f|
          f.tracker_id = @tracker.id
          f.save

          @entries = [Entry.new(), Entry.new(), Entry.new()]
          @entries.each do |e|
            e.field_id = f.id
            e.task = (0...8).map { (65 + rand(26)).chr }.join 
            e.save

        end

       
        end

        format.html { redirect_to @user, notice: 'Tracker was successfully created.' }
        format.json { render :show, status: :created, location: @tracker }
      else
        format.html { render :new }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trackers/1
  # PATCH/PUT /trackers/1.json
  def update
    respond_to do |format|
      if @tracker.update(tracker_params)
        format.html { redirect_to @tracker, notice: 'Tracker was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracker }
      else
        format.html { render :edit }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trackers/1
  # DELETE /trackers/1.json
  def destroy
    @tracker.destroy
    respond_to do |format|
      format.html { redirect_to trackers_url, notice: 'Tracker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracker
      @tracker = Tracker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracker_params
      params.require(:tracker).permit(:period)
    end
end
