import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItem {
  final String id;
  final String title;
  final int price;
  final int quantity;
  final Color color;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.color,
  });

  CartItem copyWith({
    String? id,
    String? title,
    int? price,
    int? quantity,
    Color? color,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      color: color ?? this.color,
    );
  }
}

class CartNotifier extends StateNotifier<Map<String, CartItem>> {
  CartNotifier() : super({});

  Map<String, CartItem> get items => {...state};

  int get itemCount => state.length;

  int get totalAmount {
    int total = 0;
    state.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total;
  }

  void addItem(String productId, String title, int price, Color color) {
    if (state.containsKey(productId)) {
      state = {
        ...state,
        productId: state[productId]!.copyWith(
          quantity: state[productId]!.quantity + 1,
        ),
      };
    } else {
      state = {
        ...state,
        productId: CartItem(
          id: productId,
          title: title,
          price: price,
          quantity: 1,
          color: color,
        ),
      };
    }
  }

  void removeItem(String productId) {
    state = Map.from(state)..remove(productId);
  }

  void removeSingleItem(String productId) {
    if (!state.containsKey(productId)) {
      return;
    }
    if (state[productId]!.quantity > 1) {
      state = {
        ...state,
        productId: state[productId]!.copyWith(
          quantity: state[productId]!.quantity - 1,
        ),
      };
    } else {
      state = Map.from(state)..remove(productId);
    }
  }

  void clear() {
    state = {};
  }
}

// Riverpod providers
final cartProvider = StateNotifierProvider<CartNotifier, Map<String, CartItem>>(
  (ref) => CartNotifier(),
);

final cartItemCountProvider = Provider<int>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.length;
});

final cartTotalAmountProvider = Provider<int>((ref) {
  final cart = ref.watch(cartProvider);
  int total = 0;
  cart.forEach((key, item) {
    total += item.price * item.quantity;
  });
  return total;
});
