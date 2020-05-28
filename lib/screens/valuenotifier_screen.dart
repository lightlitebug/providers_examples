import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValueNotifierScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ValueNotifier'),
      ),
      body: Consumer<ValueNotifier<int>>(builder: (context, vNotifier, child) {
        return Center(
          child: Text(
            'counter: ${vNotifier.value}',
            style: TextStyle(
              fontSize: 36,
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final counter = Provider.of<ValueNotifier<int>>(
            context,
            listen: false,
          );
          counter.value++;
        },
      ),
    );
  }
}
