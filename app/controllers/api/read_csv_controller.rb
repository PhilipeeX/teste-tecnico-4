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

  end
end

