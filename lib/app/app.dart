import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tally_task/di/service_locator.dart';
import 'package:tally_task/features/business/presentation/pages/business_page.dart';
import 'package:tally_task/features/business/presentation/provider/business_provider.dart';
import 'package:tally_task/features/business/presentation/widgets/unfocus.dart';

class TallyTaskApp extends StatelessWidget {
  const TallyTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => sl<BusinessProvider>()),
        ],
        child: MaterialApp(
          title: 'TallyTaskApp',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
            useMaterial3: true,
          ),
          home: BusinessPage(),
        ),
      ),
    );
  }
}
