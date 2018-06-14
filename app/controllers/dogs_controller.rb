class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = find_dog
  end


  def find_dog
    Dog.find(params[:id])
  end

end
