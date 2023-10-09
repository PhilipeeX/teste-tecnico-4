module Api
  class NetflixShowImporter
    def self.import_from_csv(file)
      require 'csv'

      imported_records = 0
      total_records = 0

      CSV.foreach(file, headers: true) do |row|
        total_records += 1

        begin
          NetflixShow.create!(
            show_id: row['show_id'],
            genre: row['type'],
            title: row['title'],
            director: row['director'],
            cast: row['cast'],
            country: row['country'],
            published_at: row['date_added'],
            year: row['release_year'],
            rating: row['rating'],
            duration: row['duration'],
            listed_in: row['listed_in'],
            description: row['description']
          )
          imported_records += 1
        rescue ActiveRecord::RecordInvalid => e
          return e.message
        end
      end

      if imported_records == total_records
        return true
      else
        return false
      end
    end
  end

end
