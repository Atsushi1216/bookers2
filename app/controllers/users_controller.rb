class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
