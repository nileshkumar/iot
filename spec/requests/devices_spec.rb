require 'rails_helper'

RSpec.describe "Devices", type: :request do

  let!(:site_1) { create(:site) }
  let!(:devices) { create_list(:device, 5, site: site_1) }
  let!(:device_id) { devices.first.id }

  describe "GET /devices" do
    before { get "/api/v1/sites/#{site_1.id}/devices" }

    it 'should return device list' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end

  describe "POST /devices" do
   let!(:valid_data) {{ variant_name: "Test device", manufacturer: "new manufacturer", site_id: site_1.id }}

   context 'when the request is valid' do
    before { post "/api/v1/sites/#{site_1.id}/devices", params: valid_data }

    it 'creates a device' do
      expect(response).to have_http_status(:created)
    end
   end

   context 'when the request is invalid' do
    before { post "/api/v1/sites/#{site_1.id}/devices", params: { variant_name: '' } }

      it 'returns a validation failure message' do
        expect(response.body)
      .to include("can't be blank")
      end
    end
  end

  describe 'PUT /devices/:id' do
    context 'when the request is valid' do
      before { put "/api/v1/sites/#{site_1.id}/devices/#{device_id}", params: {variant_name: 'updated variant'} }

      it 'returns status code as 200 ' do
        expect(response).to have_http_status(200)
        expect(Device.find(device_id).variant_name).to eq('updated variant')
      end
   end
  end

  describe 'DELETE /devices/:id' do
    before { delete "/api/v1/sites/#{site_1.id}/devices/#{device_id}" }

    it 'returns status code no_content' do
      expect(response).to have_http_status(:no_content)
    end
  end
 
end
