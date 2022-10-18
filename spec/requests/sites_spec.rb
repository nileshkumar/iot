require 'rails_helper'

RSpec.describe "Sites", type: :request do
  let!(:sites) { create_list(:site, 5) }
  let!(:site_id) { sites.first.id }

  describe "GET /sites" do
    before { get '/api/v1/sites' }

    it 'should return site list' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end

  describe "POST /sites" do
   let(:valid_data) {{ name: "Test Site", description: "it's a short description" }}

   context 'when the request is valid' do
    before { post '/api/v1/sites/', params: valid_data }

    it 'creates site' do
      expect(response).to have_http_status(:created)
    end
   end

   context 'when the request is invalid' do
    before { post '/api/v1/sites', params: { name: '' } }

      it 'returns a validation failure message' do
        expect(response.body)
      .to include("can't be blank")
      end
    end
  end

  describe 'PUT /sites/:id' do
    context 'when the request is valid' do
      before { put "/api/v1/sites/#{site_id}", params: {name: 'test data one'} }

      it 'returns status code as 200 ' do
        expect(response).to have_http_status(200)
        expect(Site.find(site_id).name).to eq('test data one')
      end
   end
  end

  describe 'DELETE /sites/:id' do
    before { delete "/api/v1/sites/#{site_id}" }

    it 'returns status code no_content' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
