class Setting < ActiveRecord::Base

	validates_presence_of :name, :evaluation_startdate, :evaluation_enddate, :company_id

	validate :correct_evaluation_date

	belongs_to :company

	validates :company, :associated => true
  validates :company_id, :presence => true

	private

	def correct_evaluation_date
		errors.add(:evaluation_enddate, "Must be greater than or equal to Evaluation start date") unless !evaluation_enddate.nil? && !evaluation_startdate.nil? && evaluation_enddate >= evaluation_startdate
	end
end
