import 'package:component_testing/components/text_field.dart';
import 'package:component_testing/constants/dimensions.dart';
import 'package:component_testing/constants/values.dart';
import 'package:component_testing/helper/utility.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(
          title: 'Component Testing',
        ),
      ),
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
    heightWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Main Date : ' + DateTime.now().toString(),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  getSnackBar(
                    context,
                    width,
                    'Success',
                    'Button clicked',
                    Colors.green,
                  ),
                );
              },
              child: const Text(
                'Show SnackBar',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPaddingSize20),
              child: CustomTextField(
                textEditingController: TextEditingController(),
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}
