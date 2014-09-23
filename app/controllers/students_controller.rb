class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  # GET /students/new
  def new
    @student = Student.new
  end


  def show
    @student = Student.find(params[:id])
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to students_url, :notice => 'Student was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    Student.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to students_url, :notice => 'Student was successfully destroyed.' }
    end
  end

  private

  # allow white listed params for student
  def student_params
    params.require(:student).permit(:name, :course, :roll_no)
  end
end
