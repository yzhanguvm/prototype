namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do
      query = Faker::Lorem.sentence(5)
      users.each do |user| 
        user.pubmed_searches.create!(query: query, 
                                     pubmed_link: "http://www.ncbi.nlm.nih.gov/pubmed/?term=#{query}")
      end
    end
  end
end
