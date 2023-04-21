# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'translations', type: :request do
  path '/translations' do
    post('create translation') do
      tags 'Translations'
      consumes 'application/json'
      parameter name: 'translation', in: :body, schema: {
        type: :object,
        properties: {
          source_language_code: { type: :string },
          target_language_code: { type: :string },
          source_text: { type: :string },
          glossary_id: { type: :integer }
        },
        required: %w[source_language_code target_language_code source_text]
      }

      response(201, 'created') do
        let(:translation) do
          {
            source_language_code: 'en',
            target_language_code: 'ro',
            source_text: 'This is the source text'
          }
        end
        run_test!
      end
    end
  end

  path '/translations/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show translation') do
      tags 'Translations'
      response(200, 'Successful') do
        let(:translation) { FactoryBot.create(:translation) }
        let(:id) { translation.id }
        run_test!
      end

      response(404, 'Not found') do
        let(:id) { '777' }
        run_test!
      end
    end
  end
end
