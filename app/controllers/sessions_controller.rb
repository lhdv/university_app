class SessionsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  
  def new
    
  end
  
  def create
    student = Student.find_by(email: params[:session][:email])
    if student && student.authenticate(params[:session][:password])
      session[:student_id] = student.id
      flash[:notice] = "Login successfully"
      redirect_to student
    else
      flash.now[:notice] = "Invalid credentials"
      render 'new'
    end
  end
  
  def destroy
    session[:student_id] = nil
    flash[:notice] = "Logout successfully"
      redirect_to root_path
  end

end