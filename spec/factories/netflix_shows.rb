FactoryBot.define do
  factory :netflix_show do
    show_id { "s64" }
    genre { "TV Show" }
    title { "13 Reasons Why" }
    director { "Daniel Stamm" }
    cast { "Dylan Minnette, Katherine Langford, Kate Walsh, Derek Luke, Brian d'Arcy James, Alisha Boe, Christian Navarro, Miles Heizer, Ross Butler, Devin Druid, Michele Selene Ang, Steven Silver, Amy Hargreaves" }
    country { "United States" }
    published_at { "June 5, 2020" }
    year { 2020 }
    rating { "TV-MA" }
    duration { "4 Seasons" }
    listed_in { "Crime TV Shows, TV Dramas, TV Mysteries" }
    description { "After a teenage girl's perplexing suicide, a classmate receives a series of tapes that unravel the mystery of her tragic choice." }
  end
end
