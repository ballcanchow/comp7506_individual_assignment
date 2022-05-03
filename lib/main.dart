import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "My Flutter App"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textField1Controller = TextEditingController();
  final textField2Controller = TextEditingController();
  final textField3Controller = TextEditingController();
  String resultValueString = "";

  void _clearSumAndSetState(String ignored) {
    setState(() {
      resultValueString = "";
    });
  }

  void _calculateSumAndSetState() {
    var sum = (
      (textField1Controller.text.isEmpty ? 0 : double.parse(textField1Controller.text)) +
      (textField2Controller.text.isEmpty ? 0 : double.parse(textField2Controller.text)) +
      (textField3Controller.text.isEmpty ? 0 : double.parse(textField3Controller.text))
    );

    setState(() {
      resultValueString = sum.ceil() == sum.floor() ? sum.toInt().toString() : sum.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Expanded(child: Row(
              children: const <Widget> [
                Spacer(flex: 1,),
                Expanded(flex: 14, child: Text("Please input 3 numbers", textAlign: TextAlign.left, style: TextStyle(fontSize: 24, color: Color.fromRGBO(88, 88, 255, 1)),)),
                Spacer(flex: 1,),
              ],
            )),
            Expanded(child: Row(
              children: <Widget> [
                const Spacer(flex: 1,),
                Expanded(flex: 4,child: TextField(controller: textField1Controller, onChanged: _clearSumAndSetState, inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]+(.[0-9]*)?'))], textAlign: TextAlign.right, maxLength: 8, autofocus: true)),
                const Expanded(child: Text('+', textAlign: TextAlign.center)),
                Expanded(flex: 4, child: TextField(controller: textField2Controller, onChanged: _clearSumAndSetState, inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]+(.[0-9]*)?'))], textAlign: TextAlign.right, maxLength: 8)),
                const Expanded(child: Text('+', textAlign: TextAlign.center)),
                Expanded(flex: 4, child: TextField(controller: textField3Controller, onChanged: _clearSumAndSetState, inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]+(.[0-9]*)?'))], textAlign: TextAlign.right, maxLength: 8)),
                const Spacer(flex: 1,),
              ],
            )),
            Expanded(child: Row(
              children: <Widget> [
                const Expanded(child: Text('=', textAlign: TextAlign.center, style: TextStyle(fontSize: 20),)),
                Expanded(flex: 14, child: Text(resultValueString, textAlign: TextAlign.left, style: const TextStyle(fontSize: 20),)),
                const Spacer(flex: 1,),
              ],
            )),
            Expanded(child: Row(
              children: <Widget> [
                const Spacer(flex: 8),
                Expanded(flex: 7,
                    child: ElevatedButton(
                      onPressed: _calculateSumAndSetState,
                      child: const Text('Calculate Sum'),
                    )
                ),
                const Spacer(flex: 1,),
              ],
            )),
            const Spacer()
          ]
        )
      )
    );
  }
}