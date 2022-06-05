import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_launcher/allApps.dart';
import 'package:flutter_my_launcher/dashBoard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: PageView(
            children: [
              Container(
                child: Center(
                  child: GestureDetector(
                      onDoubleTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ShowAllApps()));
                      },
                      child: Image.asset("assets/img/myLogo_white.webp")),
                ),
              ),
              // FutureBuilder(
              //     future: DeviceApps.getInstalledApplications(
              //         includeSystemApps: true,
              //         includeAppIcons: true,
              //         onlyAppsWithLaunchIntent: true),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.done) {
              //         List<Application>? allApps =
              //             snapshot.data as List<Application>?;

              //         return GridView.count(
              //           crossAxisCount: 3,
              //           physics: BouncingScrollPhysics(),
              //           children: List.generate(allApps!.length, (index) {
              //             return GestureDetector(
              //               onTap: () {
              //                 DeviceApps.openApp(allApps[index].packageName);
              //               },
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Column(
              //                   children: [
              //                     Image.memory(
              //                       (allApps[index] as ApplicationWithIcon)
              //                           .icon,
              //                       width: 50,
              //                     ),
              //                     const SizedBox(
              //                       height: 15,
              //                     ),
              //                     Text(
              //                       "${allApps[index].appName}",
              //                       style: TextStyle(color: Colors.white),
              //                       overflow: TextOverflow.ellipsis,
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             );
              //           }),
              //         );
              //       }

              //       return Container(
              //         child: Center(
              //           child: CircularProgressIndicator(),
              //         ),
              //       );
              //     })
            ],
          ),
        ),
      ),
    );
  }
}
