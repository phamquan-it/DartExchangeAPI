import 'dart:io';
import 'package:DartJson/Exchange.dart';
import 'package:DartJson/Cacultator.dart';
void main() async {
  Exchange exchange = Exchange(); // Create an instance of the Exchange class

  try {
    Map<String, dynamic> countries = await exchange.fetchExchangeRate();
    stdout.writeln(exchange.convert( countries, 100,"USD","EUR"));
    // exchange.showCountry(countries);
  } catch (e) {
    print("Error fetching exchange rates: $e");
  }


}