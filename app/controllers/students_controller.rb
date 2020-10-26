class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all  
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(name: student_params[:name], email: student_params[:email])
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
    params.require(:student).permit(:name, :email)
  end

  def set_student
    @student = Student.find(params[:id])
  end
  
end