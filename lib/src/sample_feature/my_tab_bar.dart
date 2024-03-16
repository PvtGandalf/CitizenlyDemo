import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'random_user_classes.dart';

Future<Welcome> fetchPerson() async {
  final response = await http.get(Uri.parse(
      'https://randomuser.me/api/?inc=name,location,email,phone,login'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Welcome.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Person');
  }
}

void main() => runApp(const TabBarComponent());

class TabBarComponent extends StatefulWidget {
  const TabBarComponent({super.key});

  @override
  State<TabBarComponent> createState() => _TabBarComponentState();
}

class _TabBarComponentState extends State<TabBarComponent> {
  late Future<Welcome> futurePerson;

  @override
  void initState() {
    super.initState();
    futurePerson = fetchPerson();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: AppBar(
              bottom: const TabBar(
                labelPadding:
                    EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                tabs: [
                  Text("Contact",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(116, 116, 124, 1))),
                  Text("Official Details",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(116, 116, 124, 1))),
                  Text("Jurisdiction",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(116, 116, 124, 1))),
                  Text("On the Web",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(116, 116, 124, 1))),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: FutureBuilder<Welcome>(
                      future: futurePerson,
                      builder: (context, snapshot) {
                        return Column(children: [
                          TabInfoSection(
                            keyValue: "ADDRESS:",
                            value: ("${snapshot.data!.results[0].location.street.name}, ${snapshot.data!.results[0].location.city}, ${snapshot.data!.results[0].location.state}, ${snapshot.data!.results[0].location.postcode}"),
                            icon: const Icon(
                              Icons.place,
                              color: Color.fromARGB(255, 134, 34, 151),
                              size: 16.0,
                            ),
                          ),
                          TabInfoSection(
                            keyValue: "COUNTY:",
                            value: (snapshot.data!.results[0].location.timezone.description),
                            icon: const Icon(
                              Icons.map,
                              color: Color.fromARGB(255, 134, 34, 151),
                              size: 16.0,
                            ),
                          ),
                          TabInfoSection(
                            keyValue: "EMAIL ADDRESS:",
                            value: (snapshot.data!.results[0].email),
                            icon: const Icon(
                              Icons.mail,
                              color: Color.fromARGB(255, 134, 34, 151),
                              size: 16.0,
                            ),
                          ),
                          TabInfoSection(
                            keyValue: "PHONE NUMBER:",
                            value: (snapshot.data!.results[0].phone),
                            icon: const Icon(
                              Icons.phone,
                              color: Color.fromARGB(255, 134, 34, 151),
                              size: 16.0,
                            ),
                          ),
                          TabInfoSection(
                            keyValue: "WEBSITE:",
                            value: "https://pvtgandalf.com",
                            icon: Icon(
                              Icons.web,
                              color: Color.fromARGB(255, 134, 34, 151),
                              size: 20.0,
                            ),
                          ),
                        ]);
                      })),
              Text("Official Details"),
              Text("Jurisdiction"),
              Text("On the Web"),
            ],
          ),
        ),
      ),
    );
  }
}

class TabInfoSection extends StatelessWidget {
  const TabInfoSection(
      {super.key,
      required this.keyValue,
      required this.value,
      required this.icon});

  final String keyValue;
  final String value;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: (keyValue),
                        style: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(165, 168, 175, 1))),
                  ])))),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 5, 0, 0),
                  child: Row(children: [
                    (icon),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(5, 2, 0, 0),
                        child: RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: (value),
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(66, 66, 66, 1))),
                        ]))),
                  ])))
        ]));
  }
}
