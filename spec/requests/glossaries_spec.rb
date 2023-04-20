# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'glossaries', type: :request do
  path '/glossaries' do
    get('list glossaries') do
      tags 'Glossaries'
      response(200, 'successful') do
        run_test!
      end
    end

    post('create glossary') do
      tags 'Glossaries'
      consumes 'application/json'
      parameter name: 'glossary', in: :body, schema: {
        type: :object,
        properties: {
          source_language_code: { type: :string },
          target_language_code: { type: :string }
        },
        required: %w[source_language_code target_language_code]
      }

      response(201, 'created') do
        let(:glossary) { { source_language_code: 'en', target_language_code: 'ro' } }
        run_test!
      end
    end
  end

  path '/glossaries/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show glossary') do
      tags 'Glossaries'
      response(200, 'Successful') do
        let(:glossary) { FactoryBot.create(:glossary) }
        let(:id) { glossary.id }
        run_test!
      end

      response(404, 'Not found') do
        let(:id) { '777' }
        run_test!
      end
    end
  end
end
