// lib/screens/market_screen.dart (updated)
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/crypto_provider.dart';
import '../widgets/crypto_card.dart';
import '../widgets/async_value_widget.dart';
import '../utils/ui_constants.dart';

class MarketScreen extends ConsumerWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoList = ref.watch(cryptoListProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.read(cryptoListProvider.notifier).refresh(),
        child: AsyncValueWidget(
          value: cryptoList,
          data: (cryptos) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: UIConstants.screenPadding,
                    itemCount: cryptos.length,
                    itemBuilder: (context, index) {
                      final crypto = cryptos[index];
                      return CryptoCard(crypto: crypto);
                    },
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
