class CompetitionsController < ApplicationController
  before_action :set_competition, only: %i[ show edit update destroy ]

  # GET /competitions
  def index
    @competitions = Competition.all
  end

  # GET /competitions/1
  def show
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions
  def create
    @competition = Competition.new(competition_params)

    if @competition.save
      redirect_to @competition, notice: "Competition was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /competitions/1
  def update
    if @competition.update(competition_params)
      redirect_to @competition, notice: "Competition was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /competitions/1
  def destroy
    @competition.destroy
    redirect_to competitions_url, notice: "Competition was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def competition_params
      params.require(:competition).permit(:name, :start_date, :end_date)
    end
end
