class UsersController < ApplicationController
  before_action :get_user,only: [:show,:delete]

  def index
     @user = User.all
      if @user
       render :json=> {code:200,message:"Success",data:@user.as_json}
    else
      render :json=> {code:201,message:"No User Found",data:nil}
    end
  end


  def show
      if @user
         render :json=> {code:200,message:"Success",data:@user.as_json}
      else
         render :json=> {code:200,message:"User does not Exist",data:nil}
      end
   
  end

  def create
    if params[:first_name].present? and params[:last_name].present? and params[:email].present?
      @user = User,create(first_name:params[:first_name],last_name:params[:last_name],email:params[:email])
       render :json=> {code:200,message:"Success",data:@user.as_json}
      else
         render :json=> {code:200,message:"Please Provide all parameter",data:nil}
      end
  end

  def delete
        if @user
         @user.delete
         render :json=> {code:200,message:"Success",data:""}
        else
            render :json=> {code:200,message:"User does not Exist",data:nil}

        end    
    
        
  end

  def search
    if params[:keyword].present?
      @user = User.where("first_name =? or email=? or last_name=? ",params[:keyword],params[:keyword],params[:keyword])
      render :json=> {code:200,message:"Success",data:@user.as_json}
    else
      render :json=> {code:200,message:"Please Provide Valid parameter",data:nil}
    end
  end

  private
   def get_user
       @user = User.find_by_id(params[:user_id])
   end

end
