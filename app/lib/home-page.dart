import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: TextButton(
          child: Text("Clear Selected"),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: customNavBar(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5),
            child: items[index],
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
    var controller = TextEditingController();
    final textContainer = SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: TextField(controller: controller),
    );

    var checkBox = Checkbox(
      value: false,
      onChanged: (value) {
        debugPrint(value.toString());
      },
    );
    final checkBoxContainer = SizedBox(
      width: MediaQuery.of(context).size.width * 0.20,
      child: checkBox,
    );

    setState(() {
      items.add(
        Row(
          children: [checkBox, textContainer],
        ),
      );
    });
  }
}
