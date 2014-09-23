class AssignmentsController < ApplicationController

  # GET    /classrooms/:classroom_id/assignments
  def index
    @classroom = Classroom.find(params[:classroom_id])
    #@assignments = Assignment.where(:classroom_id => params[:classroom_id]).all
    @assignments = @classroom.assignments
  end

  # GET    /classrooms/:classroom_id/assignments/new
  def new
    @classroom = Classroom.find(params[:classroom_id])
    @assignment = @classroom.assignments.build
  end

  # POST   /classrooms/:classroom_id/assignments
  def create
    @classroom = Classroom.find(params[:classroom_id])
    @assignment = Assignment.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to classrooms_url, :notice => 'Assignment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # GET /assignment/1
  def show
    @assignment = Assignment.find(params[:id])
  end

  # DELETE /classrooms/:classroom_id/assignments/:id
  def destroy

  end

  # GET /submit_assignment/:classroom_id/:assignment_id
  def submit_assignment
    # Here I have taken student_id by default "2" once student will login through authenticate way then it will be current_user.id
    submission = Submission.create(:assignment_id => params[:assignment_id], :student_id => "2")

    redirect_to classroom_assignments_path(params[:classroom_id])
  end

  private

  # allow white listed params for assignment
  def assignment_params
    params.require(:assignment).permit(:name, :description, :classroom_id)
  end
end
