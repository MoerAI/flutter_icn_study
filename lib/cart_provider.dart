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

// Cart extension methods
extension CartExtension on List<CartItem> {
  int get itemCount => length;

  int get totalAmount {
    if (isEmpty) return 0;
    return map((item) => item.price * item.quantity).reduce((a, b) => a + b);
  }

  CartItem? findById(String id) {
    try {
      return firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }
}

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(String productId, String title, int price, Color color) {
    final existingItem = state.findById(productId);

    if (existingItem != null) {
      // 기존 아이템의 수량 증가
      state = state.map((item) {
        if (item.id == productId) {
          return item.copyWith(quantity: item.quantity + 1);
        }
        return item;
      }).toList();
    } else {
      // 새 아이템 추가
      state = [
        ...state,
        CartItem(
          id: productId,
          title: title,
          price: price,
          quantity: 1,
          color: color,
        ),
      ];
    }
  }

  void removeItem(String productId) {
    state = state.where((item) => item.id != productId).toList();
  }

  void removeSingleItem(String productId) {
    final existingItem = state.findById(productId);
    if (existingItem == null) return;

    if (existingItem.quantity > 1) {
      state = state.map((item) {
        if (item.id == productId) {
          return item.copyWith(quantity: item.quantity - 1);
        }
        return item;
      }).toList();
    } else {
      removeItem(productId);
    }
  }

  void clear() {
    state = [];
  }
}

// Riverpod provider
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
  (ref) => CartNotifier(),
);
