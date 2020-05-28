import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_examples/providers/streamprovider_model.dart';

class StreamProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureProvider'),
      ),
      body: Consumer<StreamProviderModel>(
        builder: (_, sProv, __) {
          return Center(
            child: Text(
              'counter: ${sProv.counter}',
              style: TextStyle(fontSize: 36),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final sModel = Provider.of<StreamProviderModel>(
            context,
            listen: false,
          );
          sModel.incrementCounter();
        },
      ),
    );
  }
}
