class EmergenciesController < ApplicationController
  before_action :set_emergency, only: [:show, :edit, :update, :destroy]
  before_action :set_default_response_format
  # GET /emergencies
  # GET /emergencies.json
  def index
    @emergencies = Emergency.all
  end

  # GET /emergencies/1
  # GET /emergencies/1.json
  def show
  end

  # GET /emergencies/new
  def new
    page_not_found
  end

  # GET /emergencies/1/edit
  def edit
    page_not_found
  end

  # POST /emergencies
  # POST /emergencies.json
  def create
    @emergency = Emergency.new(emergency_params)

    respond_to do |format|
      if @emergency.save
        format.html { redirect_to @emergency, notice: 'Emergency was successfully created.' }
        format.json { render :show, status: :created, location: @emergency }
      else
        format.html { render :new }
        format.json { render json: {message: @emergency.errors}, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emergencies/1
  # PATCH/PUT /emergencies/1.json
  def update
    respond_to do |format|
      if @emergency.update(emergency_params)
        format.html { redirect_to @emergency, notice: 'Emergency was successfully updated.' }
        format.json { render :show, status: :ok, location: @emergency }
      else
        format.html { render :edit }
        format.json { render json: {message: @emergency.errors}, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emergencies/1
  # DELETE /emergencies/1.json
  def destroy
    page_not_found
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emergency
      def set_responder
        begin
          @responder = Responder.friendly.find(params[:id])
        rescue
          page_not_found
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emergency_params
      params.require(:emergency).permit(:code, :fire_severity, :police_severity, :medical_severity)
    end

    def set_default_response_format
      request.format = :json unless params[:format]
    end

    def page_not_found
      render status: 404, json: { message: 'page not found' }
    end
end
