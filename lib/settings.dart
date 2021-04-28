import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  String ver = "1.0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            fontFamily: 'Ubuntu',
          ),
        ),
        backgroundColor: Colors.grey[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 10.0,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 5.0),
                      child: Icon(Icons.code_rounded),
                    ),
                    title: Text(
                      "App Version",
                      style: TextStyle(
                          fontFamily: 'Ubuntu', color: Colors.grey[800]),
                    ),
                    subtitle: Text(
                      ver,
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 5.0),
                      child: Icon(Icons.exit_to_app_rounded),
                    ),
                    title: Text(
                      "Opt out",
                      style: TextStyle(
                          fontFamily: 'Ubuntu', color: Colors.grey[800]),
                    ),
                    subtitle: Text(
                      "Stop receiving all notifications",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                    onTap: () {}, // TODO Backend: Opt-Out
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
