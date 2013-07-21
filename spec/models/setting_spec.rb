require 'spec_helper'

describe Setting do

	before do
		@company = FactoryGirl.create(:company)
	end
  
	it "has a valid setting" do
		FactoryGirl.create(:setting).should be_valid
	end

	it "is invalid without attributes" do
		FactoryGirl.build(:setting, :name => nil).should_not be_valid
		FactoryGirl.build(:setting, :evaluation_startdate => nil, :evaluation_enddate => nil).should_not be_valid
	end

	it "has evaluation_enddate greater than or equal to evaluation_startdate" do
		FactoryGirl.create(:setting, :evaluation_startdate => "2013-05-05", :evaluation_enddate => "2013-07-07").should be_valid
		FactoryGirl.create(:setting, :evaluation_startdate => "2013-05-05", :evaluation_enddate => "2013-05-05").should be_valid

		FactoryGirl.build(:setting, :evaluation_startdate => "2013-05-05", :evaluation_enddate => "2013-03-03").should_not be_valid
	end

	it "has association with company" do
		FactoryGirl.build(:setting, :company_id => nil).should_not be_valid
		FactoryGirl.create(:setting, :company_id => @company.id).should be_valid
	end

end
