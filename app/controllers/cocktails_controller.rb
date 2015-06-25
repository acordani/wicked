class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  # GET /cocktails

  def index
    @cocktails = Cocktail.all
  end

  # GET /cocktail/1

  def show
  end

  # GET /cocktails/new
  def new
    @cocktail = Cocktail.new
  end

  # GET /cocktails/1/edit
  def edit
  end

  # POST /cocktails

  def create
    @cocktail = Cocktail.new(cocktail_params)

    respond_to do |format|
      if @cocktail.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
    end
  end

  # PATCH/PUT /my_models/1
  # PATCH/PUT /my_models/1.json
  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit

    end
  end

  # DELETE /my_models/1
  # DELETE /my_models/1.json
  def destroy
    @cocktail.destroy


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @coctail = Cocktail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coctail_params
      params.require(:cocktail).permit(:name, :ingredient1, :ingredient2, :ingredient3, :preparation)
    end

end
