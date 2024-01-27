import 'package:flutter/material.dart';
import 'appRouter.dart';

void main() {
  runApp(Ricky(
    appRouter: AppRouter(),
  ));
}

class Ricky extends StatelessWidget {
  final AppRouter appRouter;

  const Ricky({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}