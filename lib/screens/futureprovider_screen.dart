import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FutureProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureProvider'),
      ),
      body: Consumer<Map<String, int>>(
        builder: (_, fProv, __) {
          return Center(
            child: Text(
              'counter: ${fProv['value']}',
              style: TextStyle(fontSize: 36),
            ),
          );
        },
      ),
    );
  }
}
