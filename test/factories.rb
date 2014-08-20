# This will guess the User class
FactoryGirl.define do
  factory :place do
    sequence :name do |n|
      "Bla place #{n}"
    end

    sequence :address do |n|
      "Marienplatz #{n}"
    end

    sequence :description do |n|
      "Awesome place #{n}"
    end
  end

  factory :comment do
    
    sequence :message do |n|
      "Awesome place #{n}"
    end

    rating "2_stars"

    association :place
  end


end