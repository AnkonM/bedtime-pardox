// import 'dart:io';
// import 'dart:math';

import 'dart:math';

import 'package:bedtime_paradox/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'main_drawer.dart';
import 'data.dart';

void main() => runApp(MaterialApp(
      home: ParadoxTime(),
    ));

class ParadoxTime extends StatefulWidget {
  @override
  _ParadoxTimeState createState() => _ParadoxTimeState();
}

class _ParadoxTimeState extends State<ParadoxTime> {
  int valueChoose = 1;
  List listItem = ["1", "2", "3", "4", "5"];
  List timeList = [];

  TimeOfDay time;

  bool _hasTime = false;

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 12, minute: 00);
    final newTime =
        await showTimePicker(context: context, initialTime: initialTime);
    if (newTime == null) return;

    setState(() => time = newTime);
  }

  String getText(x) {
    if (x == null) {
      return 'Select Time';
    } else {
      final hours = x.hour.toString().padLeft(2, '0');
      final minutes = x.minute.toString().padLeft(2, '0');

      return 'Time: $hours:$minutes';
    }
  }

  FlutterLocalNotificationsPlugin localNotification;

  @override
  void initState() {
    super.initState();
    timeList.add(null);
    var androidInitialize = new AndroidInitializationSettings('logo');
    var iOSInitialize = new IOSInitializationSettings();
    var initializationSettings =
        new InitializationSettings(androidInitialize, iOSInitialize);
    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);

    loadJson();
  }

  Future _cancelNotifications() async {
    await localNotification.cancelAll();
  }

  Future scheduleNotification() async {
    var androidDetails = new AndroidNotificationDetails("channelId",
        "Local Notification", "This is the description of the notification",
        importance: Importance.High);
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(androidDetails, iosDetails);

    for (int i = 0; i < timeList.length; i++) {
      var x = timeList[i];
      if (x != null) {
        var time = Time(x.hour, x.minute, 0);

        int paradoxIndex = Random().nextInt(287);

        // getDetails(paradoxIndex);
        String notiTitle = paradoxList[paradoxIndex].title;
        String notiText = paradoxList[paradoxIndex].text;

        var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'repeatDailyAtTime channel id',
          'repeatDailyAtTime channel name',
          'repeatDailyAtTime description',
          importance: Importance.Max,
          priority: Priority.High,
          styleInformation: BigTextStyleInformation(''),
        );
        var iOSPlatformChannelSpecifics = IOSNotificationDetails();
        var platformChannelSpecifics = NotificationDetails(
            androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
        await localNotification.showDailyAtTime(
            i, notiTitle, notiText, time, platformChannelSpecifics);

        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text(
                    "Time Set",
                    style: TextStyle(fontFamily: 'Ubuntu'),
                  ),
                  content: Text(
                    "The time has been set. If you had a time previously set then it has been overwritten. Also, you can opt-out by pressing the reset button.",
                    style: TextStyle(fontFamily: 'Ubuntu'),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Ok"))
                  ],
                ));
      } else {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text(
                    "Error: Please select time first",
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  content: Text(
                    "You haven't selected the time(s) you want to recieve th notification, please try again after you have selected one time or more.",
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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(
            fontFamily: 'Ubuntu',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
        // elevation: 0.0,
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 14.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 30, 5.0, 30),
                  child: Text(
                    "Frequency: ",
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 25.0,
                      color: Colors.blue[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    dropdownColor: Colors.grey[800],
                    hint: Text(
                      "Select",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: Colors.grey[200],
                      ),
                    ),
                    value: valueChoose.toString(),
                    onChanged: (newValue) {
                      setState(() {
                        valueChoose = int.parse(newValue);
                      });
                      for (int i = 1; i < valueChoose; i++) {
                        timeList.add(time);
                      }
                    },
                    items: listItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(
                          valueItem,
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            color: Colors.grey[200],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Text(
                  "time(s) a day",
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 20.0,
                    color: Colors.grey[200],
                  ),
                )
              ],
            ),
            Divider(
              height: 40.0,
              thickness: 1.0,
              color: Colors.grey,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 67.5 * valueChoose,
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: valueChoose,
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      onTap: () async {
                        var futureValue = await pickTime(context);
                        setState(() {
                          timeList[index] = time;
                          _hasTime = true;
                        });
                      },
                      title: Text(
                        _hasTime ? getText(timeList[index]) : "Select Time:",
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      tileColor: Colors.blue[100],
                      selectedTileColor: Colors.blue[200],
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 8.0),
                  child: Text(
                    "The settings aren't saved automatically, please\npress the 'Save' button in the bottom-right corner\nin order for changes to take effect.",
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 15.0,
                      color: Colors.grey[200],
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _cancelNotifications();
                setState(() {
                  _hasTime = false;
                });
                return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: Text(
                            "You have Opt-ed out from daily notifications.",
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                          content: Text(
                            "If you want to recieve notifications again, select the desired time(s) and save.",
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
              child: Text(
                "Reset",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  color: Colors.black87,
                ),
              ),
              style: ButtonStyle(
                alignment: Alignment.center,
                backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _cancelNotifications();
          scheduleNotification();
        },
        child: Icon(
          Icons.save_rounded,
        ),
      ),
    );
  }
}
