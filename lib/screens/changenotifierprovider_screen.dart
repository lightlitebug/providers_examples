import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_examples/providers/changenotifierprovider_model.dart';
import 'package:providers_examples/providers/futureprovider_model.dart';
import 'package:providers_examples/providers/provider_model.dart';
import 'package:providers_examples/providers/streamprovider_model.dart';

class ChangeNotifierProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChangeNotifierProvider'),
      ),
      body: Consumer4<ProviderModel, FutureProviderModel, StreamProviderModel,
          ChangeNotifierModel>(
        builder: (context, provModel, fModel, sModel, cnModel, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'counter: ${cnModel.counter}',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'baseUrl: ${provModel.baseUrl}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'counter: ${fModel.counter}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'counter: ${sModel.counter}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'counter: ${cnModel.myStreamValue}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final cnModel = Provider.of<ChangeNotifierModel>(
            context,
            listen: false,
          );
          cnModel.incrementCounter();
        },
      ),
    );
  }
}
