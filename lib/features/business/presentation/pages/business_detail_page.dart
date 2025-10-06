import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tally_task/core/enum/view_state.dart';
import 'package:tally_task/features/business/presentation/provider/business_provider.dart';
import 'package:tally_task/features/business/presentation/provider/business_state.dart';
import 'package:tally_task/features/business/presentation/widgets/business_card.dart';
import 'package:tally_task/features/business/presentation/widgets/info_row.dart';

class BusinessDetailPage extends StatefulWidget {
  final String businessId;

  const BusinessDetailPage({super.key, required this.businessId});

  @override
  State<BusinessDetailPage> createState() => _BusinessDetailPageState();
}

class _BusinessDetailPageState extends State<BusinessDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<BusinessProvider>();
      provider.fetchBusinessDetail(widget.businessId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BusinessState>();
    final provider = context.read<BusinessProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Business Detail")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Builder(
          builder: (_) {
            final business = state.selectedBusiness;
            return switch (state.viewState) {
              ViewState.loading => const Center(
                child: CircularProgressIndicator(),
              ),
              ViewState.error => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.errorMessage ?? "An error occurred"),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () =>
                          provider.fetchBusinessDetail(widget.businessId),
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              ),
              ViewState.idle => const Center(child: Text("No business found")),
              ViewState.success =>
                business == null
                    ? const Center(child: Text("Business data not available"))
                    : BusinessCard(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  business.name,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                InfoRow(
                                  icon: Icons.location_on,
                                  iconColor: Colors.blue,
                                  text: business.location,
                                ),
                                const SizedBox(height: 12),
                                InfoRow(
                                  icon: Icons.phone,
                                  iconColor: Colors.green,
                                  text: business.contact,
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Text(
                                    "This [ Business Card Widget ]  is fully customizable, allowing display of business details, services, working hours, or any other relevant information. It is designed to be flexible, clean, and reusable for different data models.",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                const SizedBox(height: 250),
                              ],
                            ),
                          ),
                        ),
                      ),
            };
          },
        ),
      ),
    );
  }
}
