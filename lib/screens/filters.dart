import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/Filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  Filters({this.saveFilters, this.currentFilters});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  Widget _buildSwitchListTile(
      {String title, String subTitle, bool stateValue, Function onChanged}) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      subtitle: Text(
        subTitle,
      ),
      value: stateValue,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  Map<String, bool> selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan,
                  };
                  widget.saveFilters(selectedFilters);
                });
              },
              icon: Icon(
                Icons.save,
                color: Colors.white,
              )),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              'Adjust Your-Meals',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    title: 'Gluten-free',
                    subTitle: 'Only include Gluten-free meals',
                    stateValue: _glutenFree,
                    onChanged: (value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    }),
                _buildSwitchListTile(
                    title: 'Lactose-Free',
                    subTitle: 'Only include Lactose-free meals',
                    stateValue: _lactoseFree,
                    onChanged: (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    }),
                _buildSwitchListTile(
                    title: 'Vegetarian',
                    subTitle: 'Only include Vegetarian meals',
                    stateValue: _vegetarian,
                    onChanged: (value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    }),
                _buildSwitchListTile(
                    title: 'Vegan',
                    subTitle: 'Only include Vegan meals',
                    stateValue: _vegan,
                    onChanged: (value) {
                      setState(() {
                        _vegan = value;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
