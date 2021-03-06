import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class ShowAllApps extends StatefulWidget {
  const ShowAllApps({Key? key}) : super(key: key);

  @override
  State<ShowAllApps> createState() => _ShowAllAppsState();
}

class _ShowAllAppsState extends State<ShowAllApps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: TextFormField(
          autocorrect: true,
          enableSuggestions: true,
          // style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hoverColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
              borderSide: BorderSide(color: Colors.white),
            ),
            hintText: "Search apps here ....",
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: FutureBuilder(
            future: DeviceApps.getInstalledApplications(
                includeSystemApps: true,
                includeAppIcons: true,
                onlyAppsWithLaunchIntent: true),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<Application>? allApps =
                    snapshot.data as List<Application>?;

                return GridView.count(
                  crossAxisCount: 3,
                  physics: BouncingScrollPhysics(),
                  children: List.generate(allApps!.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        DeviceApps.openApp(allApps[index].packageName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.memory(
                              (allApps[index] as ApplicationWithIcon).icon,
                              width: 50,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "${allApps[index].appName}",
                              style: TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }

              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }),
      ),
    );
  }
}
