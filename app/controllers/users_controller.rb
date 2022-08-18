class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append('all_users', 
                                                   partial: "users/user", 
                                                   locals: { user: @user }
                                                  )
        end
        format.html { redirect_to root_path }
      end
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
