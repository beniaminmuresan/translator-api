# frozen_string_literal: true

FactoryBot.define do
  factory :translation do
    source_language_code { ACCEPTED_LANGUAGE_CODES.pluck(:code).sample }
    target_language_code { ACCEPTED_LANGUAGE_CODES.pluck(:code).sample }
    source_text { Faker::Book.title }
  end
end
