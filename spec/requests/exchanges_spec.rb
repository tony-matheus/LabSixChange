require 'rails_helper'

RSpec.describe "Exchanges", type: :request do
  describe "GET #index" do
    it "returns http success" do
      get '/'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #convert' do
    # before any action in the spec, this code will be ran,
    # to set @amount some value, that will be used after
    before do
      @amount = rand(1...9999)
    end

    it 'return http success' do
      get '/convert', params: {
          source_currency: 'USD',
          target_currency: 'BRL',
          amount: @amount
      }

      expect(response).to have_http_status(200)
    end

  end
  describe 'POST #bitcoin' do

    before do
      @amount = rand(1...9999)
    end

    it 'to bitcoin' do
      get '/bitcoin', params: {
          source_currency: 'USD',
          target_currency: 'USD',
          exchange: 'to',
          amount: @amount
      }

      expect(response).to have_http_status(200)
    end

    it 'from bitcoin' do
      get '/bitcoin', params: {
          source_currency: 'USD',
          target_currency: 'USD',
          exchange: 'from',
          amount: @amount
      }

      expect(response).to have_http_status(200)
    end

  end
end
