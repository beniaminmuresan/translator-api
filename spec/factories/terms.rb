# frozen_string_literal: true

FactoryBot.define do
  factory :term do
    source_term { 'source term' }
    target_term { 'target term' }
    association :glossary
  end
end
