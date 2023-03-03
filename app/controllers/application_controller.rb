class ApplicationController < ActionController::API
  include ActionController::Cookies

# before_action :authorize

rescue_from ActiveRecord::RecordInvalid, with: :invalid_record_response
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response

private

# def authorize
#   render json: {error: "Not authorized"}, status: :unauthorized unless session.include? :user_id
# end

def invalid_record_response(invalid)
  render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
end

def record_not_found_response(exception)
  render json: {error: "#{exception.model} not found"}, status: :not_found
end

end
