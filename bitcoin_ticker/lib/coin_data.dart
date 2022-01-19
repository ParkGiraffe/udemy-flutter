import 'package:http/http.dart' as http;
import 'dart:convert';

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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '87148869-4D95-4848-89AF-DAB381E1F092';

class CoinData {
  CoinData();

  Future getCoinData() async {
    http.Response response = await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=87148869-4D95-4848-89AF-DAB381E1F092'));
    //print(response);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
      // double rate = jsonDecode(data)['rate'];
      // int iRate = rate.round();
      // return iRate;
    } else {
      print(response.statusCode);
    }

  }
}
