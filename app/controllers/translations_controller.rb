# frozen_string_literal: true

class TranslationsController < ApplicationController
  def show
    translation = Translation.find(params[:id])
    render json: translation
  end

  def create
    Translation.create!(translation_params)
    head :created
  end

  private

    def translation_params
      params.require(:translation).permit(:source_language_code, :target_language_code, :source_text, :glossary_id)
    end
end
