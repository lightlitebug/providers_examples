import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_examples/providers/futureprovider_model.dart';

class FutureProvider2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureProvider'),
      ),
      body: Consumer<FutureProviderModel>(
        builder: (_, fProv, __) {
          return Center(
            child: Text(
              'counter: ${fProv.counter}',
              style: TextStyle(fontSize: 36),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final fModel = Provider.of<FutureProviderModel>(
            context,
            listen: false,
          );
          fModel.incrementCounter();
        },
      ),
    );
  }
}
