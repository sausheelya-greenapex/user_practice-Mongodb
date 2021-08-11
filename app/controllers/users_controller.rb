class UsersController < ApplicationController
  def get_users
     @user = User.all
      if @user
        render :json=> {code:200,message:"Success",data:@user.as_json}
      else
       render :json=> {code:201,message:"No User Found",data:nil}
      end
  end


  def user_by_id
    if params[:user_id].present?
      @user = User.find_by_id(params[:user_id])
      if @user
         render :json=> {code:200,message:"Success",data:@user.as_json}
      else
         render :json=> {code:200,message:"User does not Exist",data:nil}
      end
    else
      rende :json=> {code:301,message:"User Id must be present",data:nil}
    end
  end

  def create_user
    if params[:first_name].present? and params[:last_name].present? and params[:email].present?
      @user = User,create(first_name:params[:first_name],last_name:params[:last_name],email:params[:email])
       render :json=> {code:200,message:"Success",data:@user.as_json}
      else
         render :json=> {code:200,message:"Please Provide all parameter",data:nil}
      end
  end

  def delete_user
    if params[:user_id].present?
      @user = User.find_by_id(params[:user_id])
        if @user
         @user.delete
         render :json=> {code:200,message:"Success",data:""}
        else
            render :json=> {code:200,message:"User does not Exist",data:nil}

        end    
        else
           render :json=> {code:301,message:"User Id must be present",data:nil}
        end
   end
end
