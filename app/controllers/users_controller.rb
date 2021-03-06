class UsersController < ApplicationController
  
  def show # 追加
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end  
  
  def create
    @user = User.new(user_params)
    if @user.save
     flash[:success] = "Welcome to the Sample App!"
     redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit 
   @user = User.find(params[:id]) 
   if  @user == current_user
   
   else
     flash[:success] = "編集できません。"
     redirect_to current_user
   end 
  end
         
  def update
   @user = User.find(params[:id]) 
   if @user == current_user
   else
     flash[:success] = "編集できません。"
     redirect_to current_user
   end
   
    if @user.update(user_params) 
      flash[:success] = "編集が完了しました。"
      redirect_to @user
      
  else 
    render "edit"
    end
  end

  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :area, :profile)  
  end
end


