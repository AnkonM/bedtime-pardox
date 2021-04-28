import 'package:flutter/material.dart';

import 'about.dart';
import 'help.dart';
import 'settings.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 10.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.png'),
                        radius: 50.0,
                      ),
                    ),
                  ),
                  Text(
                    "Bedtime Paradox",
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "because why not",
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Ankon M.",
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.notifications_rounded),
                  title: Text(
                    "Notifications",
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 22.5,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help_rounded),
                  title: Text(
                    "Help",
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 22.5,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HelpPage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info_rounded),
                  title: Text(
                    "About",
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 22.5,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
