# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Term, type: :model do
  let(:instance) { FactoryBot.create(:term) }

  subject { instance }

  it { is_expected.to validate_presence_of(:source_term) }
  it { is_expected.to validate_presence_of(:target_term) }
  it { is_expected.to belong_to(:glossary) }
end
