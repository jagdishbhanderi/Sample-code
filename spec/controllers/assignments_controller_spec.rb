require 'spec_helper'

describe AssignmentsController do
  before :each do
    @classroom = FactoryGirl.create(:classroom)
  end

  describe "GET #index" do
    it "populates a list of assignment of classroom" do
      assignment = FactoryGirl.create(:assignment, :classroom_id => @classroom.id)
      get :index, :classroom_id => @classroom
      assigns(:assignments).should eq([assignment])
    end

    it "renders the :index view" do
      get :index, :classroom_id => @classroom
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested assignment to @assignment" do
      assignment = FactoryGirl.create(:assignment)
      get :show, :id => assignment, :classroom_id => @classroom
      assigns(:assignment).should eq(assignment)
    end

    it "renders the :show template" do
      get :show, :id => FactoryGirl.create(:assignment), :classroom_id => @classroom
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new assignment to @assignment" do
      get :new, :classroom_id => @classroom
      assigns(:assignment).should be_a_new(Assignment)
    end

    it "renders the :new template" do
      get :new, :classroom_id => @classroom
      response.should render_template :new
    end
  end

  describe "POST #create" do
    it "saves the new assignment in the database for classroom" do
      expect{
        post :create, :assignment => FactoryGirl.attributes_for(:assignment), :classroom_id => @classroom
      }.to change(Assignment,:count).by(1)
    end

    it "redirects to the classroom page" do
      post :create, :assignment => FactoryGirl.attributes_for(:assignment), :classroom_id => @classroom
      response.should redirect_to classrooms_url
    end
  end
end

