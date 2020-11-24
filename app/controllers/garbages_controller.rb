class GarbagesController < ApplicationController
  before_action :move_to_index, only: [:show, :new, :edit]
  before_action :set_garbage, only: [:edit, :update]
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
  end

  def update
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
    redirect_to action: :index unless user_signed_in?
  end

  def set_garbage
    @garbage = Garbage.find(params[:id])
  end

  def garbage_params
    params.require(:garbage).permit(:day, :dow, :category, :other, :title).merge(user_id: current_user.id)
  end
end
