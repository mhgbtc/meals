import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFreeFilterSet = false;
  var lactoseFreeFilterSet = false;
  var vegetarianFilterSet = false;
  var veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      /*drawer: MainDrawer(
        onSelectScreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'meals'){
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const TabsScreen())
            );
          }
        },
      ),*/
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: glutenFreeFilterSet,
            Filter.lactoseFree: lactoseFreeFilterSet,
            Filter.vegetarian: vegetarianFilterSet,
            Filter.vegan: veganFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
                value: glutenFreeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    glutenFreeFilterSet = isChecked;
                  });
                },
              title: Text(
                  'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text(
                  'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 32),
            ),
            SwitchListTile(
              value: lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 32),
            ),
            SwitchListTile(
              value: vegetarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  vegetarianFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text(
                'Only include vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 32),
            ),
            SwitchListTile(
              value: veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  veganFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text(
                'Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 32),
            ),
          ],
        ),
      ),
    );
  }
}
