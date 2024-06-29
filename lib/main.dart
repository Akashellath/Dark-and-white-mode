import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Adaptive Theme Demo',
        theme: theme,
        darkTheme: darkTheme,
        home:  MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
      debugShowFloatingThemeButton: true,
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});
  List time =[ "9:00 AM","12:00 PM","04:00 PM"];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: Drawer(
            child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, bottom: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.history,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "History",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.dark_mode,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Dark Mode",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Switch(
                    value: AdaptiveTheme.of(context).mode.isDark,
                    onChanged: (value) {
                      if (value) {
                        AdaptiveTheme.of(context).setDark();
                      } else {
                        AdaptiveTheme.of(context).setLight();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        )),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Weather App',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 200, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Color.fromARGB(255, 255, 200, 0),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Row(
                children: [
                  Text(
                    "IN",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 25,
                    width: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Kottakkal",
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Row(
                children: [Text("Scattered clouds")],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 55, top: 25),
              child: Row(
                children: [
                  Text(
                    "34°",
                    style: TextStyle(fontSize: 80),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.cloud,
                    size: 80,
                  )
                ],
              ),
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width / 1.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 192, 191, 191)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.thermostat,
                          size: 80,
                        ),
                        Row(
                          children: [
                            Text(
                              "34°",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Icon(Icons.water_drop, size: 80),
                        Row(
                          children: [
                            Text("49", style: TextStyle(fontSize: 20)),
                            Icon(
                              Icons.percent,
                            )
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Icon(Icons.air, size: 80),
                          Text("3 km/h", style: TextStyle(fontSize: 20))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Today",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 200, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("12:00 AM",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                          ),Padding(
                            padding: const EdgeInsets.only(right: 30,left: 30),
                            child: Row(
                                            children: [
                                              Text(
                                                "34°",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              Spacer(
                                               
                                              ),
                                              Icon(
                                                Icons.cloud,
                                                size: 20,
                                              )
                                            ],
                                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30,left: 30,top: 15),
                            child: Row(
                                            children: [
                                              Icon(
                                                Icons.water_drop,
                                                size: 20,
                                              ),
                                              Spacer(
                                               
                                              ),
                                              Icon(
                                                Icons.air,
                                                size: 20,
                                              )
                                            ],
                                          ),
                          ), Padding(
                            padding: const EdgeInsets.only(right: 30,left: 30,),
                            child: Row(
                                            children: [
                                              Text("49%"),
                                              Spacer(
                                               
                                              ),
                                               Text("3 km/h"),
                                            ],
                                          ),
                          ),
                        ],
                      ),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 126, 149, 189),
                      ),
                    ),
                  );
                },
                itemCount: 3,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Text(
                "5 Days Forcast",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 200, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            
          ],
        ), bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.timelapse),
        label: '9 PM',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.cloud),
        label: 'cloudy',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.thermostat),
        label: '26°',
      ),
    ],
  ),
);
  }
}
