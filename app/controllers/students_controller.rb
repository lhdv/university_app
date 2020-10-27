class StudentsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :require_same_student, only: [:edit, :update]

  def index
    @students = Student.all  
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(name: student_params[:name], email: student_params[:email], password:student_params[:password], password_confirmation:student_params[:password_confirmation])
    if @student.save
      flash[:notice] = 'Student created successfully'
      redirect_to students_path
    else
      flash[:error] = 'Student cannot be created'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:notice] = 'Student updated successfully'
      redirect_to student_path(@student)
    else
      flash[:error] = 'Student cannot be created'
      render 'edit'
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def require_same_student
    if current_user != @student
      flash[:notice] = "You can only edit your own profile"
      redirect_to current_user
    end
  end
  
end