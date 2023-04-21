# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Translation, type: :model do
  let(:instance) { FactoryBot.create(:translation) }

  subject { instance }

  it { is_expected.to validate_presence_of(:source_language_code) }
  it { is_expected.to validate_presence_of(:target_language_code) }
  it { is_expected.to validate_presence_of(:source_text) }
  it { is_expected.to validate_length_of(:source_text).is_at_most(5000) }
  it { is_expected.to belong_to(:glossary).optional }

  describe '#highlighted_source_text' do
    context 'glossary is not present' do
      let(:instance) { FactoryBot.create(:translation, glossary: nil) }

      it 'does not compute highlighted_source_text' do
        subject

        expect(instance.highlighted_source_text).to eq(nil)
      end
    end

    context 'glossary is present' do
      let(:glossary) { FactoryBot.create(:glossary) }
      let(:instance) do
        FactoryBot.create(:translation, source_language_code: glossary.source_language_code,
                                        target_language_code: glossary.target_language_code,
                                        source_text: 'Big big sentence here',
                                        glossary:)
      end

      context 'terms are not created for glossary' do
        it 'returns highlighted_source_text without any highlight' do
          subject

          expect(instance.highlighted_source_text).to eq('Big big sentence here')
        end
      end

      context 'terms are created for glossary' do
        let!(:term_1) { FactoryBot.create(:term, glossary:, source_term: 'big') }
        let!(:term_2) { FactoryBot.create(:term, glossary:, source_term: 'Here') }
        it 'returns highlighted_source_text with terms highlighted' do
          subject

          expect(instance.highlighted_source_text).to eq(
            '<HIGHLIGHT>Big</HIGHLIGHT> <HIGHLIGHT>big</HIGHLIGHT> sentence <HIGHLIGHT>here</HIGHLIGHT>'
          )
        end
      end
    end
  end
end
