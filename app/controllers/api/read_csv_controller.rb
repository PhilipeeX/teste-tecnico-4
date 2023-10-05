module Api
  class ReadCsvController < ApplicationController
    skip_before_action :verify_authenticity_token
    def read_csv
      require 'csv'

      uploaded_file = params[:csv_file]
      if uploaded_file.present?
        CSV.foreach(uploaded_file.path, headers: true) do |row|
          netflix_show = NetflixShow.new(
            show_id: row['show_id'],
            show_type: row['type'],
            title: row['title'],
            director: row['director'],
            cast: row['cast'],
            country: row['country'],
            date_added: row['date_added'],
            release_year: row['release_year'],
            rating: row['rating'],
            duration: row['duration'],
            listed_in: row['listed_in'],
            description: row['description']
          )
          netflix_show.save
        end
        head :no_content, status: :ok
      else
        render json: { error: 'Nenhum arquivo CSV fornecido.' }, status: :unprocessable_entity
      end
    end
  end
end

