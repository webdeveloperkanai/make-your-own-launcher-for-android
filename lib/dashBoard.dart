import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_launcher/allApps.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/wallpaper.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "@Web Developer Kanai",
              style: TextStyle(fontSize: 21, color: Colors.white),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.6,
            )
            // Image.asset("assets/img/myLogo_white.webp")
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onLongPressUp: () {
          print("Pressed");
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => ShowAllApps()));
        },
        child: Container(
          color: Colors.black.withOpacity(0),
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    DeviceApps.openApp("com.google.android.dialer");
                  },
                  child: Icon(Icons.phone),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    DeviceApps.openApp("com.android.chrome");
                  },
                  child: Icon(Icons.web_sharp),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ShowAllApps()));
                    },
                    child: Icon(Icons.apps)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      DeviceApps.openApp("com.google.android.apps.messaging");
                    },
                    child: Icon(Icons.message)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      DeviceApps.openApp("com.whatsapp");
                    },
                    child: Icon(Icons.whatshot_sharp)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
