class GarbagesController < ApplicationController
  before_action :move_to_index,only: [:show, :new, :edit]
  def index
    @garbage = Garbage.where(dow: Date.today.wday)
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
    garbage = Garbage.find(params[:id])
    garbage.destroy
    redirect_to garbage_path(current_user)
  end

  def show
    @garbage = Garbage.all.order(dow: 'ASC')      
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end

  end
  def garbage_params
    params.require(:garbage).permit(:day, :dow, :category, :other, :title).merge(user_id: current_user.id)
  end
end
