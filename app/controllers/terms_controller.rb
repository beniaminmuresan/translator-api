# frozen_string_literal: true

class TermsController < ApplicationController
  def create
    glossary = Glossary.find(params[:glossary_id])
    glossary.terms.create!(term_params)
    head :created
  end

  private

    def term_params
      params.require(:term).permit(:source_term, :target_term)
    end
end
