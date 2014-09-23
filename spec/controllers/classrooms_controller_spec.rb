require 'spec_helper'

describe ClassroomsController do

  describe "set student_session for student" do
    it "redirects to classrooms#index" do
      session[:role] = "student"
      get :student_session
      response.should redirect_to classrooms_url
    end
  end

  describe "GET #index" do
    it "populates a list of classrooms" do
      classroom = FactoryGirl.create(:classroom)
      get :index
      assigns(:classrooms).should eq([classroom])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested classroom to @classroom" do
      classroom = FactoryGirl.create(:classroom)
      get :show, :id => classroom
      assigns(:classroom).should eq(classroom)
    end

    it "renders the :show template" do
      get :show, :id => FactoryGirl.create(:classroom)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Classroom to @classroom" do
      get :new
      assigns(:classroom).should be_a_new(Classroom)
    end

    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST #create" do
    it "saves the new classroom in the database" do
      expect{
        post :create, :classroom => FactoryGirl.attributes_for(:classroom)
      }.to change(Classroom,:count).by(1)
    end

    it "redirects to the classroom page" do
      post :create, :classroom => FactoryGirl.attributes_for(:classroom)
      response.should redirect_to classrooms_url
    end
  end

  describe "DELETE destroy" do
    before :each do
      @classroom = FactoryGirl.create(:classroom)
    end

    it "deletes the classroom" do
      expect{
        delete :destroy, :id => @classroom
      }.to change(Classroom,:count).by(-1)
    end

    it "redirects to classrooms#index" do
      delete :destroy, :id => @classroom
      response.should redirect_to classrooms_url
    end
  end
end

