class GarbagesController < ApplicationController
  def index
    @garbage = Garbage.where(day: Date.today)
  end

  def new
    @garbage = Garbage.new
  end

  def create
    @garbage = Garbage.new(garbage_params)
    if @garbage.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @garbage = Garbage.find(params[:id])
  end

  def update
    @garbage = Garbage.find(params[:id])
    if @garbage.update(garbage_params)
       redirect_to root_path
    else
      render :edit
  end
end

  def destroy
    @garbage = Garbage.find(params[:id])
    @garbage.destroy
    redirect_to root_path
  end

  private

  def garbage_params
    params.require(:garbage).permit(:day, :dow, :category, :other, :name)
  end

end
