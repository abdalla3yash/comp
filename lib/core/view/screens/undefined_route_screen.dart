import 'package:flutter/material.dart';

class UndefinedRouteScreen extends StatelessWidget {
  const UndefinedRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This route does not exist!!',
            style: Theme.of(context).textTheme.labelLarge),
      ),
    );
  }
}
