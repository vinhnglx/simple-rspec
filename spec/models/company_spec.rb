require 'spec_helper'

describe Company do
	it "has a valid Company" do
		FactoryGirl.create(:company).should be_valid
	end

	it "is invalid without company_name" do
		FactoryGirl.build(:company, :company_name => nil).should_not be_valid
	end

	it "returns a company's full name as a string" do
		FactoryGirl.create(:company, :company_name => "APPLE").should be_valid
	end
end
