require 'spec_helper'

describe Student, 'definition' do
	subject{ build(:submission) }

	it "should have a valid factory" do 
		FactoryGirl.build(:submission).should be_valid
	end

	context "relations" do 
		it {should belong_to(:student)}
		it {should belong_to(:assignment)}
	end

	context "fields" do 
		it {should have_db_column(:student_id).of_type(:integer)}
		it {should have_db_column(:assignment_id).of_type(:integer)}
	end

end
