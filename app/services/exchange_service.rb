require 'rest-client'
require 'json'
include ApplicationHelper

class ExchangeService
  def initialize
    @exchange_api_key = credentials(:currency_api_key)
  end

  def perform source_currency, target_currency, amount
    begin
      value = currency_data_request(source_currency, target_currency)

      value * amount.to_f
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end

  def to_bitcoin(target_currency, amount)
    begin
      exchange_api_bitcoin = credentials(:currency_api_bitcoin)
      url = "https://blockchain.info/ticker"
      p url
      res = RestClient.get(url)
      value = JSON.parse(res.body)[target_currency]['last'].to_f
      value * amount.to_f
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end

  def from_bitcoin(source_currency, amount)
    begin
      exchange_api_bitcoin = credentials(:currency_api_bitcoin)
      url = "https://blockchain.info/ticker"
      res = RestClient.get(url)
      value = JSON.parse(res.body)[source_currency]['last'].to_f

      value / amount.to_f
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end

  private
  def currency_data_request(target_currency, source_currency)
    exchange_api_url = credentials(:currency_api_url)
    url = "#{exchange_api_url}?token=#{@exchange_api_key}&currency=#{source_currency}/#{target_currency}"
    res = RestClient.get(url)
    JSON.parse(res.body)['currency'][0]['value'].to_f
  end
end