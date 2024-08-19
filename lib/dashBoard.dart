import 'package:analog_clock/analog_clock.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:device_apps/device_apps.dart';
import 'package:dsi_pro/Sdk/Percent_indicator.dart';
import 'package:dsi_pro/dsi_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_launcher/allApps.dart';
import 'package:flutter_my_launcher/config.dart';
import 'package:permission_handler/permission_handler.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  requestPermission() async {
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.camera,
      Permission.audio,
      Permission.notification,
      Permission.phone,
    ].request();
    print(statuses[Permission.location]);
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GestureDetector(
            onLongPress: () {
              DSI_BOTTOM_MODAL(
                  context,
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        H2(text: "SOS! EMERGENCY?", color: Colors.red),
                        const Divider(),
                        const Icon(
                          Icons.emergency_outlined,
                          size: 100,
                          color: Color.fromARGB(255, 255, 180, 175),
                        ),
                        const SizedBox(height: 25),
                        H4(
                          text:
                              "We are connecting you with your trusted devices and sending alert in 5 seconds. Please stay tuned... \n\nPress on cancel button if you don't need any help.",
                          fontSize: 18,
                          textAlign: TextAlign.center,
                          color: const Color.fromARGB(255, 16, 69, 112),
                        ),
                      ],
                    ),
                  ));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/wallpaper.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: AnalogClock(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0,
                                color:
                                    const Color.fromARGB(143, 255, 255, 255)),
                            color: const Color.fromARGB(143, 255, 255, 255),
                            shape: BoxShape.circle),
                        width: 150.0,
                        isLive: true,
                        hourHandColor: const Color.fromARGB(255, 89, 255, 89),
                        minuteHandColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        showSecondHand: true,
                        numberColor: Colors.black87,
                        showNumbers: true,
                        showAllNumbers: false,
                        textScaleFactor: 1.4,
                        showTicks: true,
                        showDigitalClock: true,
                        // datetime: DateTime(2019, 1, 1, 9, 12, 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 60,
            child: InkWell(
              onTap: () {
                DSI_BOTTOM_MODAL(
                    context,
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          H2(text: "LOCATION SERVICE"),
                          const Divider(),
                          const SizedBox(height: 15),
                          Icon(
                            Icons.location_on_rounded,
                            size: 100,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 15),
                          H4(
                            text:
                                "$APP_NAME used location service to track your location and stay connected with your trusted devices! Remember your location is not sharing with any third party person without your permission. Only your trusted device can see your location.",
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text("Privacy - Policy"),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text("Terms and Conditions"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Center(
                            child: DSI_ICON_BUTTON(
                                title: "SHARE LOCATION",
                                icon: Icons.share,
                                borderradius: BorderRadius.circular(APP_RADIUS),
                                onPressed: () {
                                  goBack(context);
                                }),
                          )
                        ],
                      ),
                    ));
              },
              child: Container(
                height: 60,
                width: 60,
                child: AvatarGlow(
                  child: Material(
                    // Replace this child with your own
                    elevation: 8.0,
                    shape: const CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: const Icon(Icons.location_on_outlined),
                      radius: 30.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: GestureDetector(
                onVerticalDragStart: (v) {
                  go(context, const ShowAllApps());
                },
                child: Container(
                  height: 85,
                  width: DSIheightWidth(context, 100, false),
                  decoration: const BoxDecoration(
                    // color: Colors.amber,
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            DeviceApps.openApp("com.google.android.dialer");
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(APP_RADIUS),
                              ),
                              child: const Icon(
                                Icons.phone,
                                size: 26,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            DeviceApps.openApp("com.android.chrome");
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(APP_RADIUS),
                              ),
                              child: const Icon(
                                Icons.south_america,
                                size: 28,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const ShowAllApps()));
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(APP_RADIUS),
                              ),
                              child: const Icon(
                                Icons.apps,
                                size: 32,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            DeviceApps.openApp(
                                "com.google.android.apps.messaging");
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(APP_RADIUS),
                              ),
                              child: const Icon(
                                Icons.message,
                                size: 24,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            DeviceApps.openApp("com.whatsapp");
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(APP_RADIUS),
                              ),
                              child: const Icon(
                                Icons.telegram,
                                size: 32,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
      drawer: Container(
        height: DSIheightWidth(context, 100, true),
        width: DSIheightWidth(context, 100, false),
        decoration: const BoxDecoration(color: Colors.white),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(APP_NAME),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  DSI_BOTTOM_MODAL(
                      context,
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            H2(text: "Coming soon..."),
                            const Divider(),
                          ],
                        ),
                      ));
                },
                icon: const Icon(Icons.qr_code_scanner_rounded),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(18),
            children: [
              H3(text: "System Information"),
              Container(
                height: 100,
                width: DSIheightWidth(context, 100, false),
                decoration: BoxDecoration(color: Colors.amber.shade200),
              ),
              const SizedBox(height: 15),
              H3(text: "Recent Apps"),
              Container(
                height: 150,
                width: DSIheightWidth(context, 100, false),
                decoration: BoxDecoration(color: Colors.grey.shade200),
              ),
              const SizedBox(height: 15),
              H3(text: "Devices Connected"),
              Container(
                height: 150,
                width: DSIheightWidth(context, 100, false),
                decoration: BoxDecoration(color: Colors.grey.shade200),
              ),
              const SizedBox(height: 15),
              H3(text: "Recent Updates"),
              Container(
                height: 350,
                width: DSIheightWidth(context, 100, false),
                decoration: BoxDecoration(color: Colors.grey.shade200),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
