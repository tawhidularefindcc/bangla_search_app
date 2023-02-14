import 'package:flutter/material.dart';

import 'bangla_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var searchController = TextEditingController();
  List<String> filteredData = <String>[];

  @override
  void initState() {
    super.initState();
    filteredData = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: searchController,
          onChanged: (value) {
            setState(() {
              filteredData = data
                  .where((word) =>
                      word.toLowerCase().contains(value.toLowerCase()))
                  .toList();
            });
          },
          decoration: const InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredData[index]),
          );
        },
      ),
    );
  }
}
