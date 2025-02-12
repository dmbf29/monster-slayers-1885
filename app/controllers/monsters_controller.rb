class MonstersController < ApplicationController

  # 'houses/1/monsters/new'
  # 'houses/:house_id/monsters/new'
  def new
    @monster = Monster.new
    @house = House.find(params[:house_id])
  end

  # 'houses/1/monsters'
  # POST 'houses/:house_id/monsters'
  def create
    @house = House.find(params[:house_id])
    @monster = Monster.new(monster_params)
    @monster.house = @house
    if @monster.save
      redirect_to house_path(@house)
    else
      render 'houses/show', status: :unprocessable_entity
    end
  end

  def destroy
    @monster = Monster.find(params[:id])
    @monster.destroy
    redirect_to house_path(@monster.house), status: :see_other
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :image_url)
  end
end
