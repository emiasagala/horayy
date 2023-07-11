import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_mobile/providers/CarProvider.dart';
import 'package:rental_mobile/providers/bookingProvider.dart';
import 'package:rental_mobile/providers/newUserProvider.dart';
import 'package:rental_mobile/views/users/signin.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserLoginProvider()),
    ChangeNotifierProvider(create: (_) => BookingProvider()),
    ChangeNotifierProvider(create: (_) => CarProvider()),
    //
    //
    //
    //
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(primarySwatch: Colors.cyan),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: const LoginScreen(),
          );
        });
  }
}
