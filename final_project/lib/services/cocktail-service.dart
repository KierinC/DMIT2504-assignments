import 'dart:async';
import 'package:final_project/services/network.dart';

const baseUrl = '/api/json/v1/1/search.php';

class CocktailService {

  Future getRandomCocktail() async {
    Uri url = Uri(
      scheme: 'https',
      host: 'www.thecocktaildb.com',
      path: '/api/json/v1/1/random.php',
    );
    print('url: $url');
    NetworkService networkService = NetworkService(url);
    var data = await networkService.getData();
    // print(data['drinks'][0]);
    return data['drinks'][0];
  }

  Future getCocktailByFirstLetter(String letter) async {
    Uri url = Uri(
      scheme: 'https',
      host: 'www.thecocktaildb.com',
      path: baseUrl,
      query: 'f=$letter',
    );
    print('url: $url');
    NetworkService networkService = NetworkService(url);
    var data = await networkService.getData();
    return data['drinks'];
  }

  Future getCocktailByName(String name) async {
    Uri url = Uri(
      scheme: 'https',
      host: 'www.thecocktaildb.com',
      path: baseUrl,
      query: 's=$name',
    );
    print('url: $url');
    NetworkService networkService = NetworkService(url);
    var data = await networkService.getData();
    // print(data['drinks']);
    return data['drinks'];
  }

  Future getCocktailByIngredient(String ingredient) async {
    Uri url = Uri(
      scheme: 'https',
      host: 'www.thecocktaildb.com',
      path: baseUrl,
      query: 'i=$ingredient',
    );
    print('url: $url');
    NetworkService networkService = NetworkService(url);
    var data = await networkService.getData();
    print(data['drinks']);
    return data['drinks'];
  }

}

