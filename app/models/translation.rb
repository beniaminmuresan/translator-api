# frozen_string_literal: true

class Translation < ApplicationRecord
  validates :source_language_code, inclusion: { in: ACCEPTED_LANGUAGE_CODES.pluck(:code),
                                                message: 'is not a valid language code' }
  validates :target_language_code, inclusion: { in: ACCEPTED_LANGUAGE_CODES.pluck(:code),
                                                message: 'is not a valid language code' }
  validates_presence_of :source_language_code, :target_language_code, :source_text
  validates :source_text, length: { maximum: 5000 }
  validate :language_codes_match_glossary_codes, if: -> { glossary.present? }
  belongs_to :glossary, optional: true

  def highlighted_source_text
    highlight_source_text if glossary.present?
  end

  private

    def highlight_source_text
      h_source_text = source_text
      terms_to_be_highlighted.each do |term|
        h_source_text = h_source_text.gsub(term.downcase, "<HIGHLIGHT>#{term.downcase}</HIGHLIGHT>")
        h_source_text = h_source_text.gsub(term.capitalize, "<HIGHLIGHT>#{term.capitalize}</HIGHLIGHT>")
      end
      h_source_text
    end

    def terms_to_be_highlighted
      glossary_source_terms.select { |term| source_text.downcase.include?(term.downcase) }
    end

    def glossary_source_terms
      glossary.terms.pluck(:source_term)
    end

    def language_codes_match_glossary_codes
      errors.add(:source_language_code, 'must match with glossary language code') unless source_language_codes_match?
      errors.add(:target_language_code, 'must match with glossary language code') unless target_language_codes_match?
    end

    def source_language_codes_match?
      glossary.source_language_code == source_language_code
    end

    def target_language_codes_match?
      glossary.target_language_code == target_language_code
    end
end
