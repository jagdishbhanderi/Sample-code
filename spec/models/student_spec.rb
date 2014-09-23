require 'spec_helper'

describe Student, 'definition' do
	subject{ build(:student) }

	it "should have a valid factory" do 
		FactoryGirl.build(:student).should be_valid
	end

	context "relations" do 
		it {should have_many(:assignments).through(:classrooms)}
		it {should have_many(:submissions)}
	end

	context "fields" do 
		it {should have_db_column(:name).of_type(:string)}
		it {should have_db_column(:course).of_type(:string)}
		it {should have_db_column(:roll_no).of_type(:integer)}
	end

	context "validation" do
		it { should validate_presence_of(:name) }
	end

end
