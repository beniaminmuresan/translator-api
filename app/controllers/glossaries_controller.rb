# frozen_string_literal: true

class GlossariesController < ApplicationController
  def index
    render json: Glossary.all
  end

  def show
    render json: Glossary.find(params[:id])
  end

  def create
    Glossary.create!(glossary_params)

    head :created
  end

  private

    def glossary_params
      params.require(:glossary).permit(:source_language_code, :target_language_code)
    end
end
