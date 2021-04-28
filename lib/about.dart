import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:launch_review/launch_review.dart';

class AboutPage extends StatelessWidget {
  _launchURL(x) async {
    String url = x;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    String ver = "1.0";

    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        title: Text(
          "About",
          style: TextStyle(
            fontFamily: 'Ubuntu',
          ),
        ),
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
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
                fontSize: 22.5,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Version: $ver",
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 15.0,
                color: Colors.grey[200],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Bedtime Paradox is an open-source app created entirely by me from the ground up using flutter(dart). Since this app is only for gaining practical experience in app development, the source code has been made available in GitHub for others' reference and critique.",
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 17.0,
                color: Colors.grey[100],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Please create a new GitHub issue for bug reports or suggestions.",
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 17.0,
                color: Colors.grey[100],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            MdiIcons.twitter,
                            color: Colors.grey[100],
                          ),
                          iconSize: 69.0,
                          onPressed: () {
                            _launchURL("https://twitter.com/i_smellpennies");
                          },
                        ),
                        Text(
                          "Twitter",
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            color: Colors.grey[100],
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            MdiIcons.earth,
                            color: Colors.grey[100],
                          ),
                          iconSize: 69.0,
                          onPressed: () {
                            return showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                      title: Text(
                                        "Coming Soon",
                                        style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Text("Ok"))
                                      ],
                                    ));
                          },
                        ),
                        Text(
                          "Website",
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            color: Colors.grey[100],
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          MdiIcons.github,
                          color: Colors.grey[100],
                        ),
                        iconSize: 69.0,
                        onPressed: () {
                          return showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    title: Text(
                                      "Coming Soon",
                                      style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Text("Ok"))
                                    ],
                                  ));
                        },
                      ),
                      Text(
                        "GitHub",
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          color: Colors.grey[100],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: ElevatedButton(
                child: Text(
                  "Rate the App",
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                  ),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.grey[100])))),
                onPressed: () {
                  LaunchReview.launch();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
