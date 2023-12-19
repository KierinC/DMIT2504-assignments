import 'package:final_project/models/cocktail-list.dart';
import 'package:flutter/material.dart';
import 'package:final_project/services/cocktail-service.dart';
import 'package:final_project/models/cocktail.dart';
import 'dart:async';

class SearchView extends StatefulWidget {
  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState extends State<SearchView> {
  String searchTerm = "";
  List<Cocktail> cocktails = [];

  String formatIngredients(Map<String, dynamic> json) {
    String out = "";
    for (var i = 1; i < 16; i++) {
      if (json['strMeasure$i'] != null && json['strMeasure$i'] != "") {
        out += json['strIngredient$i'] + ' ' + json['strMeasure$i'] + '\n';
      }
    }
    return out.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocktail Finder'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: 
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Search by Cocktail",
                ),
                onChanged: (value) => searchTerm = value,
              ),
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width) / 2,
                child:
                  ElevatedButton(
                    child: const Text(
                      'Search',
                    ),
                    onPressed: () async {
                      CocktailService cocktailService = CocktailService();
                      cocktails.clear();
                      var searchResults = [];

                       if (searchTerm.length == 1) {
                        searchResults = await cocktailService.getCocktailByFirstLetter(searchTerm);
                      } else {
                        searchResults = await cocktailService.getCocktailByName(searchTerm);
                      }

                      for (var i = 0; i < searchResults.length; i++) {
                        print(searchResults[i]['strDrink']);
                        print(searchResults[i]['strInstructions']);
                        print(formatIngredients(searchResults[i]));

                        cocktails.add(Cocktail(
                          name: searchResults[i]['strDrink'],
                          imageUrl: searchResults[i]['strDrinkThumb'],
                          instructions: searchResults[i]['strInstructions'],
                          ingredients: formatIngredients(searchResults[i]),
                        ));
                      }
                      print(searchResults);
                      setState(() {});
                    },
                  ),
              ),
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width) / 2,
                child:
                  ElevatedButton(
                    child: const Text(
                      'Random Cocktail',
                    ),
                    onPressed: () async {
                      CocktailService cocktailService = CocktailService();
                      cocktails.clear();

                      var searchResult = await cocktailService.getRandomCocktail();
                      print(searchResult['strDrink']);
                      print(searchResult['strInstructions']);

                      cocktails.add(Cocktail(
                        name: searchResult['strDrink'],
                        imageUrl: searchResult['strDrinkThumb'],
                        instructions: searchResult['strInstructions'],
                        ingredients: formatIngredients(searchResult),
                      ));
                      setState(() {});
                    },
                  ),
              ),
            ],
          ),
          Expanded(
            child: CocktailList(
              cocktails: cocktails
            ),
          )
        ],
      ),
    );
  }
}