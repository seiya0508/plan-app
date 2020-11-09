class GarbagesController < ApplicationController
  def index
    @garbage = Garbage.all
  end

  def new
    @garbage = Garbage.new
  end

  def create
    @garbage = Garbage.new(garbage_params)
    @garbage.save
    redirect_to root_path
  end

  def edit
    @garbage = Garbage.find(params[:id])
  end
  
  def update
    @garbage = Garbage.find(params[:id])
    @garbage.update(garbage_params)
    redirect_to root_path
  end
  

  private
  def garbage_params
    params.require(:garbage).permit(:day, :dow, :category, :other)
  end
end
