import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../cart_provider.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('장바구니'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: cart.isEmpty
          ? const Center(
              child: Text('장바구니가 비어있습니다.', style: TextStyle(fontSize: 18)),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: item.color,
                            child: Text(
                              item.title[0],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(item.title),
                          subtitle: Text('${item.price}원 x ${item.quantity}개'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  cartNotifier.removeSingleItem(item.id);
                                },
                              ),
                              Text('${item.quantity}'),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  cartNotifier.addItem(
                                    item.id,
                                    item.title,
                                    item.price,
                                    item.color,
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  cartNotifier.removeItem(item.id);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '총 금액: ${cart.totalAmount}원',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cartNotifier.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('장바구니가 비워졌습니다.'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: const Text('장바구니 비우기'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
