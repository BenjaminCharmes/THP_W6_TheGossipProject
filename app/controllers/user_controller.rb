class UserController < ApplicationController
  before_action :authenticate_user, only: [:edit, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def new
    @cities = City.all
  end

  def create
    @cities = City.all

    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      age: params[:age],
      city_id: params[:city].to_i,
      description: params[:description]
    )
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

end