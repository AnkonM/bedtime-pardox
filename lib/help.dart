import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  List<Item> _data = [
    Item(
      headerValue: "What is Bedtime Paradox?",
      expandedValue:
          "Bedtime Paradox is an open source app that sends periodic notifications containing a random paradox for absolutely no reason whatsoever.\n",
    ),
    Item(
      headerValue: "Why Bedtime Paradox?",
      expandedValue: "Because why not.",
    ),
    Item(
      headerValue: "How do I set up notifications?",
      expandedValue:
          "In the 'Notification' page, you must select the desired frequency of notifications each day and then select the time you want them.\n",
    ),
    Item(
      headerValue: "How do I stop the notifications?",
      expandedValue:
          "To opt-out, press the 'Reset' button at the bottom of the home page.\n",
    ),
    Item(
      headerValue: "App buggy where complain?",
      expandedValue:
          "The option to raise a GitHub issue regardign a bug report or suggestion is present in the 'About' page.\n",
    ),
    Item(
      headerValue: "I accidentally destroyed the world, what do?",
      expandedValue: "Sorry, cant help with that.\n",
    ),
  ];

  Widget _buildListPanel() {
    return ExpansionPanelList(
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
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                  ),
                ),
              );
            },
            body: ListTile(
              title: Text(
                item.expandedValue,
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                ),
              ),
            ),
            isExpanded: item.isExpanded);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Help",
          style: TextStyle(
            fontFamily: 'Ubuntu',
          ),
        ),
        backgroundColor: Colors.grey[850],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25.0,
            ),
            Center(
              child: Text(
                "FAQ",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 75.0,
                  color: Colors.grey[850],
                  fontWeight: FontWeight.w800,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(5.0, 5.0),
                      blurRadius: 8.0,
                      color: Colors.grey[700],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 45.0,
            ),
            SingleChildScrollView(
              child: Container(
                child: Card(
                    margin: EdgeInsets.all(10.0),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 10.0,
                    child: _buildListPanel()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  String headerValue;
  String expandedValue;
  bool isExpanded;

  Item({this.headerValue, this.expandedValue, this.isExpanded = false});
}
