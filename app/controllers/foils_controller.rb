class FoilsController < ApplicationController
  before_action :set_foil, only: %i[show edit update destroy]

  def index
    @foils = Foil.all
    @foil = Foil.new
  end

  def edit; end

  def create
    @foil = Foil.new(foil_params)
    @foil.user = current_user

    if @foil.save
      redirect_to foils_path, notice: 'Foil was successfully created.'
    else
      render :index
    end
  end

  def update
    if @foil.update(foil_params)
      redirect_to foils_path, notice: 'Foil was successfully updated.'
    else
      render :edit
    end
  end

  # def destroy
  #   @foil.destroy
  #   redirect_to foils_url, notice: 'Foil was successfully destroyed.'
  # end

  private

  def set_foil
    @foil = Foil.find(params[:id])
  end

  def foil_params
    params.require(:foil).permit(:title, :description, :short_description, :url)
  end
end
