RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /currencydatafeed.com/)
    .with(headers: {
        'Accept' => '*/*'
    }).to_return(status: 200, body: '
    {
      "status" : true,
      "currency" : [
         {
            "currency" : "USD/BRL",
            "value" : "3.41325",
            "date" : "2018-04-20 17:22:59",
            "type" : "original"
         }
      ]
    }', headers:{})

    stub_request(:get, /blockchain.info/)
        .with(headers: {
            'Accept' => '*/*'
        }).to_return(status: 200, body: '
        {
          "USD" : {"15m" : 3210.01, "last" : 3210.01, "buy" : 3210.01, "sell" : 3210.01, "symbol" : "$"},
          "AUD" : {"15m" : 4471.39, "last" : 4471.39, "buy" : 4471.39, "sell" : 4471.39, "symbol" : "$"},
          "BRL" : {"15m" : 12573.6, "last" : 12573.6, "buy" : 12573.6, "sell" : 12573.6, "symbol" : "R$"},
          "CAD" : {"15m" : 4296.11, "last" : 4296.11, "buy" : 4296.11, "sell" : 4296.11, "symbol" : "$"},
          "CHF" : {"15m" : 3203.89, "last" : 3203.89, "buy" : 3203.89, "sell" : 3203.89, "symbol" : "CHF"},
          "CLP" : {"15m" : 2197582.5, "last" : 2197582.5, "buy" : 2197582.5, "sell" : 2197582.5, "symbol" : "$"},
          "CNY" : {"15m" : 22173.45, "last" : 22173.45, "buy" : 22173.45, "sell" : 22173.45, "symbol" : "¥"},
          "DKK" : {"15m" : 21196.65, "last" : 21196.65, "buy" : 21196.65, "sell" : 21196.65, "symbol" : "kr"},
          "EUR" : {"15m" : 2817.37, "last" : 2817.37, "buy" : 2817.37, "sell" : 2817.37, "symbol" : "€"},
          "GBP" : {"15m" : 2549.85, "last" : 2549.85, "buy" : 2549.85, "sell" : 2549.85, "symbol" : "£"},
          "HKD" : {"15m" : 25078.99, "last" : 25078.99, "buy" : 25078.99, "sell" : 25078.99, "symbol" : "$"},
          "INR" : {"15m" : 231005.05, "last" : 231005.05, "buy" : 231005.05, "sell" : 231005.05, "symbol" : "₹"},
          "ISK" : {"15m" : 395954.81, "last" : 395954.81, "buy" : 395954.81, "sell" : 395954.81, "symbol" : "kr"},
          "JPY" : {"15m" : 358121.14, "last" : 358121.14, "buy" : 358121.14, "sell" : 358121.14, "symbol" : "¥"},
          "KRW" : {"15m" : 3635943.59, "last" : 3635943.59, "buy" : 3635943.59, "sell" : 3635943.59, "symbol" : "₩"},
          "NZD" : {"15m" : 4722.08, "last" : 4722.08, "buy" : 4722.08, "sell" : 4722.08, "symbol" : "$"},
          "PLN" : {"15m" : 12178.45, "last" : 12178.45, "buy" : 12178.45, "sell" : 12178.45, "symbol" : "zł"},
          "RUB" : {"15m" : 214508.82, "last" : 214508.82, "buy" : 214508.82, "sell" : 214508.82, "symbol" : "RUB"},
          "SEK" : {"15m" : 29083.0, "last" : 29083.0, "buy" : 29083.0, "sell" : 29083.0, "symbol" : "kr"},
          "SGD" : {"15m" : 4420.18, "last" : 4420.18, "buy" : 4420.18, "sell" : 4420.18, "symbol" : "$"},
          "THB" : {"15m" : 105374.95, "last" : 105374.95, "buy" : 105374.95, "sell" : 105374.95, "symbol" : "฿"},
          "TWD" : {"15m" : 99048.02, "last" : 99048.02, "buy" : 99048.02, "sell" : 99048.02, "symbol" : "NT$"}
        }', headers:{})
  end
end