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

  def capture
    url = Foil.find(params[:format]).url
    ws = Webshot::Screenshot.instance
    ws.capture("http://#{url}/", "app/assets/images/#{url}.png") do |magic|
      magic.combine_options do |c|
        # c.thumbnail '1000x'
        # c.background 'white'
        # c.extent '1920x1080'
        # c.gravity 'north'
        # c.delay 0.2
        c.quality 90
        c.scale(-1)
      end
    end
  end

  private

  def set_foil
    @foil = Foil.find(params[:id])
  end

  def foil_params
    params.require(:foil).permit(:title, :description, :short_description, :url)
  end
end
