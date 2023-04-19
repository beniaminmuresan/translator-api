# frozen_string_literal: true

require 'csv'

ACCEPTED_LANGUAGE_CODES = CSV.read('config/language-codes.csv').map do |lang_attrs|
  { code: lang_attrs.first, contry: lang_attrs.second }
end
