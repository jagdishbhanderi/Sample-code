class ClassroomsController < ApplicationController

  def student_session
    session[:role] = "student"
    redirect_to classrooms_url
  end

  # GET /classrooms
  def index
    @classrooms = Classroom.all
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
  end

  # GET /classrooms/1
  def show
    @classroom = Classroom.find(params[:id])
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = Classroom.new(classroom_params)

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to classrooms_url, :notice => 'Classroom was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    Classroom.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to classrooms_url, :notice => 'Classroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # allow white listed params for classroom
  def classroom_params
    params.require(:classroom).permit(:name, :description)
  end
end
