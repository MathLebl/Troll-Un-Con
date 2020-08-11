class ConsController < ApplicationController
before_action :set_con, only: %i[destroy show troll ]

  def index
    @cons = Con.all
  end

  def show
  end

  def troll
    case @con.category
    when "de_gauche"
      Brief.call(@con)
      Atlantico.call(@con)
    when "de_droite"
      Rubynl.call(@con)
    else
      Brief.call(@con)
      Rubynl.call(@con)
      Atlantico.call(@con)
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
    params.require(:con).permit(:email, :phone, :name, :category)
  end

  def set_con
    @con = Con.find(params[:id])
  end
end
