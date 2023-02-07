class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
      render json: {errors: 'Not Found'}, status: :not_found
  end

  def record_invalid invalid
      render json: {errors: invalid.record.errors.full_message}, status: :unprocessable_entity
  end
end
