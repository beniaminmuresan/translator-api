# frozen_string_literal: true

class Term < ApplicationRecord
  validates_presence_of :source_term, :target_term
  belongs_to :glossary
end
