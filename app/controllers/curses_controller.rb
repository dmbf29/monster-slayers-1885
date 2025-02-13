class CursesController < ApplicationController
  # get '/monsters/:monster_id/curses/new'
  def new
    @monster = Monster.find(params[:monster_id])
    @curse = Curse.new
    # @powers = Power.order(name: :asc)
    # @powers = @monster.powers
    @powers = Power.where.not(id: @monster.powers).order(name: :asc)
  end

  # post '/monsters/:monster_id/curses'
  def create
    @monster = Monster.find(params[:monster_id])
    @curse = Curse.new(curse_params)
    @curse.monster = @monster
    if @curse.save
      redirect_to house_path(@monster.house)
    else
      @powers = Power.where.not(id: @monster.powers).order(name: :asc)
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def curse_params
    params.require(:curse).permit(:power_id)
  end
end
