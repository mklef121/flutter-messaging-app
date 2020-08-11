import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> groups = ['Messages', 'Online', 'Groups', 'Requests'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: groups.length,
          itemBuilder: (BuildContext context, int count) {
            return GestureDetector(
              onTap: () {
                this.setState(() {
                  this.selectedIndex = count;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 30.0),
                child: Text(groups[count],
                    style: TextStyle(
                        color: count == this.selectedIndex
                            ? Colors.white
                            : Colors.white60,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        letterSpacing: 1.2)),
              ),
            );
          }),
    );
  }
}
