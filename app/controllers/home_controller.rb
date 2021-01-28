class HomeController < ApplicationController
  def index
    @foils = User.first.foils
  end
end
