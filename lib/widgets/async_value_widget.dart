  
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget? loadingWidget;
  final Widget Function(Object, StackTrace?)? error;

  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.loadingWidget,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => loadingWidget ?? const Center(child: CircularProgressIndicator()),
      error: error ??
        (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                Text(
                  'Error: ${error.toString()}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 16),
                
              ],
            ),
          ),
        ),
    );
  }
}