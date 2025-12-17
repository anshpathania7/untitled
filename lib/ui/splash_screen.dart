import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => SplashProvider()..init(),
        builder: (context, child) =>
            Consumer<SplashProvider>(builder: (context, state, child) {
          return Center(
            child: Column(
              children: [
                Text(state.isInitializing ? "Initiazling" : "Success"),
                CircularProgressIndicator(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
