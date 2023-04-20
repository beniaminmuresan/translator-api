# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Term, type: :model do
  let(:instance) { FactoryBot.create(:glossary) }

  subject { instance }

  it {
    is_expected.to validate_uniqueness_of(:source_language_code)
               .scoped_to(:target_language_code)
      .with_message('scope with target language code already taken')
  }
  it {
    is_expected.to validate_inclusion_of(:source_language_code)
      .in_array(ACCEPTED_LANGUAGE_CODES.pluck(:code))
      .with_message('is not a valid language code')
  }
  it {
    is_expected.to validate_inclusion_of(:target_language_code)
      .in_array(ACCEPTED_LANGUAGE_CODES.pluck(:code))
      .with_message('is not a valid language code')
  }
  it { is_expected.to have_many(:terms) }
end
