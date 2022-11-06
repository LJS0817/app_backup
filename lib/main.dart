import 'models/themeModel.dart';
import 'screens/index.dart';
import 'screens/create_soap.dart';
import 'models/soap_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Soap_Provider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          '/index': (context) => IndexScreen(),
          '/create/soap': (context) => SoapScreen(),
        },
        initialRoute: '/index',
      ),
    );
  }
}
