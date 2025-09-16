import 'package:flutter/material.dart';
import 'package:tally_task/app/app.dart';
import 'package:tally_task/di/service_locator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServiceLocator();
  runApp(const TallyTaskApp());
}

