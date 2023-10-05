FactoryBot.define do
  factory :netflix_show do
    show_type { "MyString" }
    title { "MyString" }
    director { "MyString" }
    cast { "MyString" }
    country { "MyString" }
    date_added { "2023-10-04" }
    release_year { 1 }
    rating { "MyString" }
    duration { "MyString" }
    listed_in { "MyString" }
    description { "MyText" }
  end
end
