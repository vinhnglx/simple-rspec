FactoryGirl.define do
  factory :setting do
    company_id { FactoryGirl.create(:company).id}
    name "AsNet"
    desc "This is my description"
    evaluation_startdate "2013-07-21"
    evaluation_enddate "2013-07-21"
    visible_indirectmanager false
    anon_manager false
    manager_mandated false
    directReport_mandated false
    self_mandated false
  end
end
