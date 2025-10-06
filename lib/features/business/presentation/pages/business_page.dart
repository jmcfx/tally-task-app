import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tally_task/core/enum/view_state.dart';
import 'package:tally_task/features/business/presentation/pages/business_detail_page.dart';
import 'package:tally_task/features/business/presentation/provider/business_provider.dart';
import 'package:tally_task/features/business/presentation/provider/business_state.dart';
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
    final state = context.watch<BusinessState>();
    final provider = context.read<BusinessProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Businesses"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search ......
            TextField(
              onChanged: provider.search,
              decoration: InputDecoration(
                hintText: "Search businesses",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Main State....
            Expanded(
              child: switch (state.viewState) {
                ViewState.loading => const Center(
                  child: CircularProgressIndicator(),
                ),
                ViewState.error => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.errorMessage ?? "Something went wrong"),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: provider.fetchBusinesses,
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                ),
                ViewState.idle => const Center(
                  child: Text("No businesses found"),
                ),
                ViewState.success => ListView.separated(
                  itemCount: state.businesses.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final business = state.businesses[index];
                    return BusinessCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                BusinessDetailPage(businessId: business.id),
                          ),
                        );
                        debugPrint(
                          'Business ID tapped: ${business.id}\n'
                          'Name: ${business.name}\n'
                          'Location: ${business.location}\n'
                          'Contact: ${business.contact}',
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            business.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(business.location),
                          const SizedBox(height: 2),
                          Text(business.contact),
                        ],
                      ),
                    );
                  },
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
