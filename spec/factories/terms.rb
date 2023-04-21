# frozen_string_literal: true

FactoryBot.define do
  factory :term do
    source_term { Faker::Verb.base }
    target_term { Faker::Verb.base }
    association :glossary
  end
end
