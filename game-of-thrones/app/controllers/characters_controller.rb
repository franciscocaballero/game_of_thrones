class CharactersController < ApplicationController

def show
  @character = Character.find(params[:id])
end

def new
  @house = House.find(params[:house_id])
  @character = @house.characters.new
end

def edit
  @house = House.find(params[:house_id])
  @character = Character.find(params[:id])
end

def create
    @house = House.find(params[:house_id])
    @character = @house.characters.create(character_params)

    if @character.save
      redirect_to house_path(@house), notice: "A new character was created."
    else
      redirect_to house_path(@house)
    end
  end

def update
    @house = House.find(params[:house_id])
    @character = Character.find(params[:id])

    if @character.update(character_params)
      redirect_to house_character_path(@house, @character)
    else
      render 'edit'
    end
  end

def destroy
  @character = Character.find(params[:id]
  @character.destroy
  redirect_to house_path(@character.house)
end

private
def character_params
  params.require(:character).permit(:name)
end
end
