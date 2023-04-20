# frozen_string_literal: true

module ErrorHandlingConcern
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

    private

      def record_not_found(error)
        render json: { error: }, status: :not_found
      end

      def unprocessable_entity(error)
        render json: { error: }, status: :unprocessable_entity
      end
  end
end
