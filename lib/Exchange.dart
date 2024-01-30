import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
class Exchange{
  String api = 'https://v6.exchangerate-api.com/v6/6c72478a6eee6589a2877778/latest/USD';
  Future<Map<String,dynamic>> fetchExchangeRate() async{
    final  response = await http.get(Uri.parse(api));
    if(response.statusCode == 200) {
      String jsonString = response.body.toString();
      Map<String, dynamic> exchangeRateMap = json.decode(jsonString)["conversion_rates"];
      return exchangeRateMap;
    }else{
      throw Exception("Request api error!");
    }
  }

  double convert(Map<String, dynamic> countries, double current,String from, String to)
  {
    double crr = double.parse(countries[from].toString());
    double newM = double.parse(countries[to].toString());
    return current/crr*newM;
  }
  void showCountry(Map<String, dynamic> countries){
    countries.forEach((key, value) { stdout.writeln(countries); });
  }
}