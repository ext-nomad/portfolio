class HomeController < ApplicationController
  def index; end

  # def captive
  #   ws = Webshot::Screenshot.instance
  #   ws.capture('http://ext-rubygems.herokuapp.com/', 'app/assets/images/rg.png') do |magic|
  #     magic.combine_options do |c|
  #       # c.thumbnail '1000x'
  #       # c.background 'white'
  #       # c.extent '1920x1080'
  #       # c.gravity 'north'
  #       c.quality 90
  #       c.scale(-1)
  #     end
  #   end
  # end
end
