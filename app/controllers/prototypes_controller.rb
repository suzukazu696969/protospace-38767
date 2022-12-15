class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy] 
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_edit, only: [:edit]


  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if  @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:catch_copy, :title, :image, :concept).merge(user_id: current_user.id)
  end

  def set_tweet
    @prototype = Prototype.find(params[:id])
  end

  def move_to_edit
    unless current_user == @prototype.user
      redirect_to root_path
    end
  end
end
