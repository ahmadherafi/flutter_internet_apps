import 'package:flutter/material.dart';
import 'package:flutter_internet_apps/core/init/dependency_injection.dart';
import 'package:flutter_internet_apps/core/routing/routing_manager.dart';
import 'package:flutter_internet_apps/features/auth/presentation_layer/screens/login.dart';
import 'package:get/get.dart';

void main() {
  DependencyInjection.injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splash,
      getPages: RoutingManager.pages,
      // home: const LoginScreen(),
    );
  }
}
