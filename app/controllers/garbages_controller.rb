class GarbagesController < ApplicationController
  def index
  end

  def new
    @garbage = Garbage.new
  end

  def create
    @garbage = Garbage.new(garbage_params)
    @garbage.save
  end
  
  private
  def garbage_params
    params.require(:garbage).permit(:day, :dow, :category, :other)
  end
end
