# frozen_string_literal: true

class GlossarySerializer < ActiveModel::Serializer
  attributes :source_language_code, :target_language_code
end
