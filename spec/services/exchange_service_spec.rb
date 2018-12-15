require 'spec_helper'
require 'json'
require './app/services/exchange_service'

describe 'Currency' do
  it 'exchange' do
    amount = rand(0..9999)
    res = ExchangeService.new.perform("USD", "BRL", amount)
    expect(res.is_a? Numeric).to eql(true)
    expect(res != 0 || amount == 0).to eql(true)
  end
end

describe 'bitcoin' do
  it 'to' do
    amount = rand(0..9999)
    res = ExchangeService.new.to_bitcoin('USD', amount)
    expect(res.is_a? Numeric).to eql(true)
    expect(res != 0 || amount == 0).to eql(true)
  end

  it 'from' do
    amount = rand(0..9999)
    res = ExchangeService.new.from_bitcoin('USD', amount)
    expect(res.is_a? Numeric).to eql(true)
    expect(res != 0 || amount == 0 || res > 1).to eql(true)
  end
end