import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_examples/providers/changenotifierprovider_model.dart';
import 'package:providers_examples/providers/futureprovider_model.dart';
import 'package:providers_examples/providers/provider_model.dart';
import 'package:providers_examples/providers/streamprovider_model.dart';
import 'package:providers_examples/providers/valuelistenableprovider_model.dart';

import 'package:providers_examples/screens/changenotifierprovider_screen.dart';
import 'package:providers_examples/screens/futureprovider2_screen.dart';
import 'package:providers_examples/screens/futureprovider_screen.dart';
import 'package:providers_examples/screens/provider_screen.dart';
import 'package:providers_examples/screens/streamprovider_screen.dart';
import 'package:providers_examples/screens/valuelistenableprovider_screen.dart';
import 'package:providers_examples/screens/valuenotifier_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProviderModel>(
          create: (_) => ProviderModel(),
        ),
        FutureProvider<Map<String, int>>(
          initialData: {'value': 0},
          create: (_) async {
            await Future.delayed(Duration(seconds: 2));
            return {'value': 1};
          },
        ),
        FutureProvider<FutureProviderModel>(
          initialData: FutureProviderModel(counter: 0),
          create: (_) => futureProviderFunc(),
        ),
        StreamProvider<StreamProviderModel>(
          initialData: StreamProviderModel(counter: 0),
          create: (_) => streamProviderFunc(),
        ),
        ChangeNotifierProxyProvider3<ProviderModel, FutureProviderModel,
            StreamProviderModel, ChangeNotifierModel>(
          create: (_) => ChangeNotifierModel(),
          update: (context, provModel, fModel, sModel, cnModel) {
            cnModel.provModel = provModel;
            cnModel.fModel = fModel;
            cnModel.sModel = sModel;
            return cnModel;
          },
        ),
        ChangeNotifierProvider<ValueNotifier<int>>(
          create: (_) => ValueNotifier<int>(0),
        ),
        ValueListenableProvider<double>(
          create: (_) => ValueListenableProviderModel(0.0),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  'Provider',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ProviderScreen();
                    }),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  'ChangeNotifierProvider',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ChangeNotifierProviderScreen();
                    }),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  'ValueNotifier',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ValueNotifierScreen();
                    }),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  'FutureProvider',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return FutureProviderScreen();
                    }),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  'FutureProvider2',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return FutureProvider2Screen();
                    }),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  'StreamProvider',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return StreamProviderScreen();
                    }),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  'ValueListenableProvider',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ValueListenableProviderScreen();
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
