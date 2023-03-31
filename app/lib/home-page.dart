import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TextField> items = [];
  List<TextEditingController> controllers = [];
  List<bool> isChecked = [];

  @override
  void initState() {
    super.initState();
    initialiseFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(),
      bottomNavigationBar: customNavBar(),
      drawer: homePageDrawer(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: items[index],
            value: isChecked[index],
            onChanged: (value) {
              setState(() {
                isChecked[index] = value!;
              });
            },
          );
        },
      ),
    );
  }

  Container customNavBar() {
    return Container(
      height: 80,
      color: Colors.blue,
      child: InkWell(
        onTap: () {
          addItemToList();
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: const [
              Icon(
                Icons.add_circle_outline,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addItemToList() async {
    setState(() {
      controllers.add(TextEditingController());
      items.add(TextField(
        controller: controllers[controllers.length - 1],
      ));
      isChecked.add(false);
    });
  }

  void clearSelected() {
    for (int i = isChecked.length - 1; i >= 0; i--) {
      if (isChecked[i]) {
        setState(() {
          isChecked.removeAt(i);
          items.removeAt(i);
          controllers.removeAt(i);
        });
      }
    }
  }

  void initialiseFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  AppBar homePageAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: clearSelected,
            icon: const Icon(Icons.clear_outlined),
          ),
        ],
      ),
    );
  }

  Drawer homePageDrawer() {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Hello"),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Settings"),
                Icon(Icons.settings),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Log out"),
                Icon(Icons.logout),
              ],
            ),
          )
        ],
      ),
    );
  }
}
