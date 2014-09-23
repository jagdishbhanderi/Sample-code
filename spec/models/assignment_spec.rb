require 'spec_helper'

describe Student, 'definition' do
	subject{ build(:assignment) }

	it "should have a valid factory" do 
		FactoryGirl.build(:assignment).should be_valid
	end

	context "relations" do 
		it {should belong_to(:classroom)}
		it {should have_many(:submissions)}
		
	end

	context "fields" do 
		it {should have_db_column(:name).of_type(:string)}
		it {should have_db_column(:description).of_type(:text)}
		it {should have_db_column(:classroom_id).of_type(:integer)}
	end

end
