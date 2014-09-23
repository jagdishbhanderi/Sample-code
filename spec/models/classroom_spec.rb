require 'spec_helper'

describe Student, 'definition' do
	subject{ build(:classroom) }

	it "should have a valid factory" do 
		FactoryGirl.build(:classroom).should be_valid
	end

	context "relations" do 
		# it {should belongs_to(:student)}
		it {should have_many(:assignments)}
	end

	context "fields" do 
		it {should have_db_column(:name).of_type(:string)}
		it {should have_db_column(:description).of_type(:text)}
	end

	context "validation" do
		it { should validate_presence_of(:name) }
	end

end
