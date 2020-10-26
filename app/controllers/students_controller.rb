class StudentsController < ApplicationController

  def index
    @students = Student.all  
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(name: params[:student][:name], email: params[:student][:email])
    if @student.save
      flash[:notice] = 'Student created successfully'
      redirect_to students_path
    else
      flash[:error] = 'Student cannot be created'
      render 'new'
    end
  end
  
end