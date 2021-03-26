import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:bitcoin_ticker/ApiKey.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate/';
//const apiKey = 'YOUR-API-KEY-HERE';

class CoinData {
  CoinData(this.crypto, this.fiat);

  String crypto;
  String fiat;

  Future<int> getCoinData() async {
    var url = '$coinAPIURL$crypto/$fiat?apikey=$apiKey';
    print(url);

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      int rate = jsonResponse['rate'].toInt();
      return rate;
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
    return 0;
  }
}
