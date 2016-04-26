class RespondersController < ApplicationController
  before_action :set_responder, only: [:show, :edit, :update, :destroy]
  before_action :set_default_response_format
  # GET /responders
  # GET /responders.json
  def index
    @responders = Responder.search(params[:show])
  end

  # GET /responders/1
  # GET /responders/1.json
  def show
  end

  # GET /responders/new
  def new
    page_not_found
  end

  # GET /responders/1/edit
  def edit
    page_not_found
  end

  # POST /responders
  # POST /responders.json
  def create
    @responder = Responder.new(responder_params)

    respond_to do |format|
      if @responder.save
        format.html { redirect_to @responder, notice: 'Responder was successfully created.' }
        format.json { render :show, status: :created, location: @responder }
      else
        format.html { render :new }
        format.json { render json: {message: @responder.errors}, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responders/1
  # PATCH/PUT /responders/1.json
  def update
    respond_to do |format|
      if @responder.update(responder_params)
        format.html { redirect_to @responder, notice: 'Responder was successfully updated.' }
        format.json { render :show, status: :ok, location: @responder }
      else
        format.html { render :edit }
        format.json { render json: {message: @responder.errors}, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responders/1
  # DELETE /responders/1.json
  def destroy
    page_not_found
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_responder
      begin
        @responder = Responder.friendly.find(params[:id])
      rescue
        page_not_found
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def responder_params
      params.require(:responder).permit(:type, :name, :capacity)
    end

    def set_default_response_format
      request.format = :json unless params[:format]
    end

    def page_not_found
      render status: 404, json: { message: 'page not found' }
    end
end
