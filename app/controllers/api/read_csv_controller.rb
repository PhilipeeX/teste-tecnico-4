module Api
  class ReadCsvController < ApplicationController
    skip_before_action :verify_authenticity_token

    def import_csv
      require 'csv'
      file = params[:csv_file]

      if file.nil? || !File.exist?(file.tempfile)
        render json: { error: I18n.t('controllers.api.read_csv.file_error') }, status: :unprocessable_entity
        return
      end

      if NetflixShowImporter.import_from_csv(file.tempfile.path)
        head :no_content, status: :ok
      else
        render status: :unprocessable_entity
      end
    end

    def show_json
      @netflix_shows = NetflixShow.order(year: :desc)
      response = @netflix_shows.map do |show|
        {
          id: show.id,
          title: show.title,
          genre: show.genre,
          year: show.year,
          country: show.country,
          published_at: show.published_at,
          description: show.description
        }
      end
      render json: response
    end

  end
end

