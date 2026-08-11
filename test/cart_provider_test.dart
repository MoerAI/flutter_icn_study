import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icn_study/cart_provider.dart';

void main() {
  group('CartItem value equality', () {
    test('two CartItems with identical field values are equal', () {
      final a = CartItem(
        id: 'apple',
        title: 'Apple',
        price: 1200,
        quantity: 1,
        color: Colors.red,
      );
      final b = CartItem(
        id: 'apple',
        title: 'Apple',
        price: 1200,
        quantity: 1,
        color: Colors.red,
      );

      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('CartItems differing in any field are not equal', () {
      final base = CartItem(
        id: 'apple',
        title: 'Apple',
        price: 1200,
        quantity: 1,
        color: Colors.red,
      );

      expect(base, isNot(equals(base.copyWith(id: 'banana'))));
      expect(base, isNot(equals(base.copyWith(title: 'Banana'))));
      expect(base, isNot(equals(base.copyWith(price: 800))));
      expect(base, isNot(equals(base.copyWith(quantity: 2))));
      expect(base, isNot(equals(base.copyWith(color: Colors.blue))));
    });

    test('value equality makes list-level containment work', () {
      final item = CartItem(
        id: 'apple',
        title: 'Apple',
        price: 1200,
        quantity: 1,
        color: Colors.red,
      );

      final state = <CartItem>[
        CartItem(
          id: 'apple',
          title: 'Apple',
          price: 1200,
          quantity: 1,
          color: Colors.red,
        ),
      ];

      expect(state.contains(item), isTrue);
    });
  });

  group('CartNotifier duplicate behaviour', () {
    test('adding the same product twice increments quantity, not length', () {
      final notifier = CartNotifier();

      notifier.addItem('apple', 'Apple', 1200, Colors.red);
      notifier.addItem('apple', 'Apple', 1200, Colors.red);

      expect(notifier.state.length, 1);
      expect(notifier.state.single.quantity, 2);
      expect(notifier.state.totalAmount, 2400);
    });

    test('re-adding an identical product emits a distinct state value', () {
      final notifier = CartNotifier();
      notifier.addItem('apple', 'Apple', 1200, Colors.red);
      final before = notifier.state;

      notifier.addItem('apple', 'Apple', 1200, Colors.red);
      final after = notifier.state;

      // Value equality must distinguish quantity 1 from quantity 2 so that
      // Riverpod/UI listeners actually observe the change.
      expect(after, isNot(equals(before)));
    });

    test('an unchanged rebuild of the same cart compares equal by value', () {
      final notifier = CartNotifier();
      notifier.addItem('apple', 'Apple', 1200, Colors.red);

      final snapshot = notifier.state
          .map((item) => item.copyWith())
          .toList(growable: false);

      expect(snapshot, equals(notifier.state));
    });

    test('removeSingleItem decrements then removes', () {
      final notifier = CartNotifier();
      notifier.addItem('apple', 'Apple', 1200, Colors.red);
      notifier.addItem('apple', 'Apple', 1200, Colors.red);

      notifier.removeSingleItem('apple');
      expect(notifier.state.single.quantity, 1);

      notifier.removeSingleItem('apple');
      expect(notifier.state, isEmpty);
    });
  });
}
