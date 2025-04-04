import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:zyptopulse/gen/assets.gen.dart';
import '../models/crypto_model.dart';
import '../providers/crypto_provider.dart';
import '../utils/ui_constants.dart';

class CryptoCard extends ConsumerWidget {
  final CryptoModel crypto;

  const CryptoCard({
    super.key,
    required this.crypto,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavoriteAsync = ref.watch(isFavoriteProvider(crypto.name));
    final favoriteIdAsync = ref.watch(favoriteIdProvider(crypto.name));
    final theme = Theme.of(context);

    final bool isPositive = crypto.priceChangePercentage24h >= 0;
    final String priceChange =
        crypto.priceChangePercentage24h.toStringAsFixed(2);

    return Padding(
      padding: UIConstants.smallContentPadding,
      child: Column(
        children: [
          Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.25,
              children: [
                CustomSlidableAction(
                  
                  onPressed: (context) async {
                    final isFavorite = isFavoriteAsync.valueOrNull ?? false;
                    if (isFavorite) {
                      final favoriteId = favoriteIdAsync.valueOrNull;
                      if (favoriteId != null) {
                        await ref
                            .read(favoritesProvider.notifier)
                            .removeFavorite(favoriteId);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Removed from favorites')),
                          );
                        }
                      }
                    } else {
                      await ref
                          .read(favoritesProvider.notifier)
                          .addFavorite(crypto);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to favorites')),
                        );
                      }
                    }
                  },
                  backgroundColor: theme.scaffoldBackgroundColor,
                  foregroundColor: Colors.amber,
                  child: isFavoriteAsync.when(
                    data: (isFavorite) => Icon(
                      isFavorite ? Icons.star : Icons.star_border,
                    ),
                    loading: () => const SizedBox(
                      width: 24,
                      height: 24,
                      child: Center(
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    error: (_, __) => const Icon(Icons.star_border),
                  ),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          crypto.imageUrl,
                          width: 40,
                          height: 40,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  crypto.symbol.substring(0, 1).toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: UIConstants.smallSpacing),

                        
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              crypto.name,
                              style: theme.textTheme.titleSmall,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              crypto.symbol.toUpperCase(),
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Flexible(
                  flex: 3,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (isPositive) Assets.icons.priceGainIndicator.svg(),
                        if (!isPositive) Assets.icons.priceLossIndicator.svg(),
                        const SizedBox(width: UIConstants.extraLargeSpacing),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              crypto.currentPrice.toStringAsFixed(2),
                              style: theme.textTheme.titleSmall,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${isPositive ? '+' : ''}$priceChange%',
                              style: TextStyle(
                                color: isPositive ? Colors.green : Colors.red,
                                fontSize:
                                    theme.textTheme.labelMedium?.fontSize ?? 14,
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Divider(
                endIndent: 8,
                indent: 8,
                height: 2,
                thickness: 0.6,
                color: Colors.grey.shade800,
              ),
            ),
          )
        ],
      ),
    );
  }
}
