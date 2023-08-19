import 'package:flutter/material.dart';

import 'package:meals/widgets/filter_switch_list_tile.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFreeFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFreeFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        // drawer: MainDrawer(
        //   onSelectScreen: (identifier) {
        //     Navigator.of(context).pop();
        //     if (identifier == 'meals') {
        //       Navigator.of(context).pushReplacement(
        //         MaterialPageRoute(
        //           builder: (ctx) => const TabsScreen(),
        //         ),
        //       );
        //     }
        //   },
        // ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop({
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _lactoseFreeFilterSet,
              Filter.vegetarian: _vegetarianFreeFilterSet,
              Filter.vegan: _veganFreeFilterSet,
            });
            return false;
          },
          child: Column(
            children: [
              FilterSwitchListTile(
                filterType: _glutenFreeFilterSet,
                filterName: 'Gluten-Free',
                onChecked: (isChecked) {
                  setState(() {
                    _glutenFreeFilterSet = isChecked;
                  });
                },
              ),
              FilterSwitchListTile(
                filterType: _lactoseFreeFilterSet,
                filterName: 'Lactose-Free',
                onChecked: ((isChecked) {
                  setState(() {
                    _lactoseFreeFilterSet = isChecked;
                  });
                }),
              ),
              FilterSwitchListTile(
                filterType: _vegetarianFreeFilterSet,
                filterName: 'Vegetarian',
                onChecked: ((isChecked) {
                  setState(() {
                    _vegetarianFreeFilterSet = isChecked;
                  });
                }),
              ),
              FilterSwitchListTile(
                filterType: _veganFreeFilterSet,
                filterName: 'Vegan',
                onChecked: ((isChecked) {
                  setState(() {
                    _veganFreeFilterSet = isChecked;
                  });
                }),
              )
            ],
          ),
        ));
  }
}
