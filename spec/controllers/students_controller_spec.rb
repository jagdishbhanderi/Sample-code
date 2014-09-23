require 'spec_helper'

describe StudentsController do

  describe "GET #index" do
    it "populates a list of students" do
      student = FactoryGirl.create(:student)
      get :index
      assigns(:students).should eq([student])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested student to @student" do
      student = FactoryGirl.create(:student)
      get :show, :id => student
      assigns(:student).should eq(student)
    end

    it "renders the :show template" do
      get :show, :id => FactoryGirl.create(:student)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Student to @student" do
      get :new
      assigns(:student).should be_a_new(Student)
    end

    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST #create" do
    it "saves the new student in the database" do
      expect{
        post :create, :student => FactoryGirl.attributes_for(:student)
      }.to change(Student,:count).by(1)
    end

    it "redirects to the student page" do
      post :create, :student => FactoryGirl.attributes_for(:student)
      response.should redirect_to students_url
    end
  end

  describe "DELETE destroy" do
    before :each do
      @student = FactoryGirl.create(:student)
    end

    it "deletes the student" do
      expect{
        delete :destroy, :id => @student
      }.to change(Student,:count).by(-1)
    end

    it "redirects to students#index" do
      delete :destroy, :id => @student
      response.should redirect_to students_url
    end
  end
end

