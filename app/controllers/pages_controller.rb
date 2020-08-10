class PagesController < ApplicationController
  def home
    @con = Con.new
  end
end
