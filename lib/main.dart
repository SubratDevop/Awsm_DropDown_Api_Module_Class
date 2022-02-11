import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:practiceflutter/Models/CountryModel.dart';
import 'package:http/http.dart' as http;

import 'Services/GetCountry.dart';

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
      home: const MyHomePage(title: 'Awsm_DropDown_Api_Module_Class'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CountryModel? countryModel;

  //fetch Country

  String? selectCountry;

  @override
  void initState() {
    super.initState();

    Service_getTrainer().fetchCountry().then((c) {
      setState(() {
        countryModel = c;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button  many times:',
            ),
            countryModel == null
                ? Text(
                    'Loading',
                    style: Theme.of(context).textTheme.headline4,
                  )
                : Text(
                    '${countryModel!.countries.length}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
            countryModel != null
                ? DropdownButton(
                  hint: Text("Choose Country"),
                    value: selectCountry,
                    items: countryModel!.countries.map((list) {
                      return DropdownMenuItem(
                        value: list.country..toString(),
                        child: Text(list.country),
                      );
                    }).toList(),
                    onChanged: (String? selectCountry) {
                      setState(() {
                        this.selectCountry = selectCountry;
                      });
                    },
                  )
                : Container(height: 30,width: 30,child: const CircularProgressIndicator(color: Colors.red,))
          ],
        ),
      ),
    );
  }
}
