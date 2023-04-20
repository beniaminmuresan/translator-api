# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'terms', type: :request do
  path '/glossaries/{glossary_id}/terms' do
    parameter name: 'glossary_id', in: :path, type: :string, description: 'glossary_id'

    post('create term') do
      response(201, 'created') do
        let(:glossary) { FactoryBot.create(:glossary) }
        let(:glossary_id) { glossary.id }
        tags 'Terms'
        consumes 'application/json'
        parameter name: 'term', in: :body, schema: {
          type: :object,
          properties: {
            source_term: { type: :string },
            target_term: { type: :string }
          },
          required: %w[source_term target_term]
        }
        let(:term) { { source_term: 'source term', target_term: 'target term' } }
        run_test!
      end
    end
  end
end
