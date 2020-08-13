class ConsController < ApplicationController
  before_action :set_con, only: %i[destroy show troll]

  def index
    @cons = Con.all
  end

  def show
  end

  def troll
    case @con.category
    when "de_gauche"
      Rubynl.call(@con)
      Lefigaro.call(@con)
      # Brief.call(@con)
      # Atlantico.call(@con)
    when "de_droite"
      PartiSocialiste.call(@con)
      Mediapart.call(@con)
      # Lemedia.call(@con)
    when "full_frontal"
      Mediapart.call(@con)
      Rubynl.call(@con)
      Lefigaro.call(@con)
      PartiSocialiste.call(@con)
      # Brief.call(@con)
      # Atlantico.call(@con)
      # Lemedia.call(@con)
    end
  end

  def new
    @con = Con.new
  end

  def create
    @con = Con.new(con_params)
    @con.save!
    redirect_to con_path(@con)
  end

  def destroy
    @con.destroy
    redirect_to root_path
  end

  private

  def con_params
    params.require(:con).permit(:email, :phone, :name, :category, :first_name, :postal)
  end

  def set_con
    @con = Con.find(params[:id])
  end
end
