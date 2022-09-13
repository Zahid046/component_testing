import 'package:component_testing/helper/date_converter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Main Date : ' + DateTime.now().toString(),
            ),
            Text(
              'Converted DateTime : ' + DateConverter.formatDate(DateTime.now()),
            ),
            Text(
              'Converted DateTime: ' + DateConverter.dateTimeStringToDateTime(DateTime.now().toString()),
            ),
            Text(
              'Converted Date : ' + DateConverter.dateTimeStringToDateOnly(DateTime.now().toString()),
            ),
            Text(
              'Converted Date : ' + DateConverter.dateTimeStringToDate(DateTime.now().toString()).toString(),
            ),
            Text(
              'Converted Date : ' + DateConverter.convertStringToDateTime(DateTime.now().toIso8601String().toString()).toString(),
            ),
            Text(
              'Converted Date : ' + DateConverter.isoStringToLocalDate(DateTime.now().toIso8601String().toString()).toString(),
            ),
            Text(
              'Converted Date : ' + DateConverter.isoStringToLocalTimeOnly(DateTime.now().toIso8601String().toString()),
            ),
            Text(
              'Converted Date : ' + DateConverter.isoStringToLocalDateOnly(DateTime.now().toIso8601String().toString()),
            ),
            Text(
              'Converted Date : ' + DateConverter.isoStringToLocalAmPm(DateTime.now().toIso8601String().toString()),
            ),
            Text(
              'Converted Date : ' + DateConverter.isoStringToLocalDateAndTime(DateTime.now().toIso8601String().toString()),
            ),
            Text(
              'Converted Date : ' + DateConverter.localDateToIsoString(DateTime.now()),
            ),
            Text(
              'Converted Date : ' +
                  DateConverter.convertTimeToTime(DateTime.now().hour.toString() + ':' + DateTime.now().minute.toString() + ':' + DateTime.now().second.toString()),
            ),
            Text(
              'Converted Date : ' + DateConverter.timeDistanceInMin(DateTime.now().toString()).toString(),
            ),
          ],
        ),
      ),
    );
  }
}
