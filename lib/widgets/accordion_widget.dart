
import 'package:flutter/material.dart';

class AccordionWidget extends StatefulWidget {
  const AccordionWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AccordionWidgetState createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> {
  final List<Item> _data = generateItems(5);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: ExpansionPanelList(
          elevation: 1,
          expandedHeaderPadding: const EdgeInsets.all(0),
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = !isExpanded;
            });
          },
          children: _data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    item.headerValue,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
              body: ListTile(
                title: Text(item.expandedValue),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}