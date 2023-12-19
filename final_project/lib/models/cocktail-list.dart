import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'cocktail.dart';

class CocktailList extends StatefulWidget {
  const CocktailList({required this.cocktails});

  final List<Cocktail> cocktails;

  @override
  State<StatefulWidget> createState() {
    return _CocktailListState();
  }
}

class _CocktailListState extends State<CocktailList> {
  @override
  Widget build(BuildContext context) {
    return _buildCocktailList(context, widget.cocktails);
  }
  
  ListView _buildCocktailList(context, List<Cocktail> cocktails) {
    return ListView.builder(
      itemCount: cocktails.length,
      itemBuilder:(context, index) {
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(cocktails[index].imageUrl),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(cocktails[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(cocktails[index].instructions, style: const TextStyle(fontSize: 16)),
                  Text(cocktails[index].ingredients, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}