FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar" 

    factory :admin do
      admin true
    end
  end

  factory :pubmed_search do
    user    
    query "Lorem ipsum"
    pubmed_link "http://www.ncbi.nlm.nih.gov/pubmed/?term=Lorem+ipsum"
  end
end
