import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tally_task/core/enum/view_state.dart';
import 'package:tally_task/features/business/presentation/provider/business_provider.dart';
import 'package:tally_task/features/business/presentation/widgets/business_card.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BusinessProvider>().fetchBusinesses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Businesses')),
      body: Consumer<BusinessProvider>(
        builder: (context, provider, _) {
          final state = provider.state;
          return switch (state.viewState) {
            ViewState.loading => const Center(
              child: CircularProgressIndicator(),
            ),
            ViewState.error => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage!),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => provider.fetchBusinesses(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
            ViewState.idle => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No businesses found'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => provider.fetchBusinesses(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
            ViewState.success => ListView.builder(
              itemCount: state.businesses.length,
              itemBuilder: (context, index) {
                final business = state.businesses[index];
                return BusinessCard(business: business);
              },
            ),
          };
        },
      ),
    );
  }
}
