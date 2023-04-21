# frozen_string_literal: true

class TranslationSerializer < ActiveModel::Serializer
  attributes :id, :source_language_code, :target_language_code, :source_text, :highlighted_source_text
end
