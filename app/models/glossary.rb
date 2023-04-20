# frozen_string_literal: true

class Glossary < ApplicationRecord
  validates :source_language_code, uniqueness: { scope: :target_language_code,
                                                 message: 'scope with target language code already taken' }
  validates :source_language_code, inclusion: { in: ACCEPTED_LANGUAGE_CODES.pluck(:code),
                                                message: 'is not a valid language code' }
  validates :target_language_code, inclusion: { in: ACCEPTED_LANGUAGE_CODES.pluck(:code),
                                                message: 'is not a valid language code' }
  has_many :terms
end
