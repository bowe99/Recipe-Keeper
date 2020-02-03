import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget buildFilterSwitch(
    String title,
    bool identifier,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      value: identifier,
      subtitle: Text('Only includes $title meals.'),
      onChanged: updateValue,
    );
  }

  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegeterian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.save,
                ),
                onPressed: () {
                  widget.saveFilters({
                    'gluten': _glutenFree,
                    'vegan': _vegan,
                    'vegetarian': _vegeterian,
                    'lactose': _lactoseFree,
                  });
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your Meal Selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildFilterSwitch(
                    'Gluten Free',
                    _glutenFree,
                    (newValue) {
                      setState(
                        () {
                          _glutenFree = newValue;
                        },
                      );
                    },
                  ),
                  buildFilterSwitch(
                    'Vegan',
                    _vegan,
                    (newValue) {
                      setState(
                        () {
                          _vegan = newValue;
                        },
                      );
                    },
                  ),
                  buildFilterSwitch(
                    'Vegeterian',
                    _vegeterian,
                    (newValue) {
                      setState(
                        () {
                          _vegeterian = newValue;
                        },
                      );
                    },
                  ),
                  buildFilterSwitch(
                    'Lactose Free',
                    _lactoseFree,
                    (newValue) {
                      setState(
                        () {
                          _lactoseFree = newValue;
                        },
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
