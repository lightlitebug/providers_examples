import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValueListenableProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ValueListenableProvider'),
      ),
      body: Center(
        child: Consumer<double>(
          builder: (context, dblCounter, child) {
            return Text(
              '$dblCounter',
              style: TextStyle(fontSize: 36),
            );
          },
        ),
      ),
    );
  }
}
