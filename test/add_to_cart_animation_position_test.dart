import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icn_study/cart_provider.dart';
import 'package:icn_study/main.dart';
import 'package:icn_study/widgets/add_to_cart_animation.dart';

/// CardSwiper keeps the next card mounted behind the visible one, so the
/// add-to-cart button matches twice. Index 1 is the front card the user taps.
Finder addToCartButton() =>
    find.widgetWithText(ElevatedButton, '장바구니에 담기').at(1);

Future<void> tapAddToCart(WidgetTester tester) async {
  // The CardSwiper drag surface sits above the button, so the hit-test warning
  // is a false negative; the tap is delivered and verified by its effects.
  await tester.tap(addToCartButton(), warnIfMissed: false);
  await tester.pump();
}

/// Runs [body] with a working network image loader.
///
/// Widget tests fail every HTTP request, so the product cards' remote image
/// would raise noise unrelated to the behaviour under test. The binding asserts
/// the hook is unset while the test body is still on the stack, so it has to be
/// cleared here rather than in a tearDown.
Future<void> withStubbedNetworkImages(Future<void> Function() body) async {
  debugNetworkImageHttpClientProvider = () => _FakeHttpClient();
  try {
    await body();
  } finally {
    debugNetworkImageHttpClientProvider = null;
  }
}

Future<void> pumpApp(
  WidgetTester tester, {
  ProviderContainer? container,
}) async {
  await tester.binding.setSurfaceSize(const Size(600, 1200));
  addTearDown(() => tester.binding.setSurfaceSize(null));

  await tester.pumpWidget(
    container == null
        ? const ProviderScope(child: MyApp())
        : UncontrolledProviderScope(container: container, child: const MyApp()),
  );
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 500));
}

void main() {
  testWidgets('animation starts at the tapped button, not an ancestor box', (
    tester,
  ) async {
    await withStubbedNetworkImages(() async {
      await pumpApp(tester);

      final buttonTopLeft = tester.getTopLeft(addToCartButton());
      expect(
        buttonTopLeft,
        isNot(equals(Offset.zero)),
        reason: 'sanity: the button is not at the surface origin',
      );

      await tapAddToCart(tester);
      await tester.pump(const Duration(milliseconds: 16));

      final overlay = tester.widget<AddToCartAnimationOverlay>(
        find.byType(AddToCartAnimationOverlay),
      );

      // Resolving the RenderBox from the page's build context yields the Scaffold
      // body origin instead of the pressed button, misplacing the animation.
      expect(
        overlay.startPosition,
        within(distance: 1.0, from: buttonTopLeft),
        reason:
            'startPosition ${overlay.startPosition} should match the pressed '
            'button at $buttonTopLeft, not an ancestor RenderBox origin',
      );

      await tester.pumpAndSettle();
    });
  });

  testWidgets('animation overlay closes itself and leaves no pending timer', (
    tester,
  ) async {
    await withStubbedNetworkImages(() async {
      await pumpApp(tester);

      await tapAddToCart(tester);
      expect(find.byType(AddToCartAnimationOverlay), findsOneWidget);

      // Must settle on its own; a listener attached after forward() never fires,
      // which strands the dialog on screen forever.
      await tester.pumpAndSettle();
      expect(find.byType(AddToCartAnimationOverlay), findsNothing);
    });
  });

  testWidgets('tapping add-to-cart puts exactly one item in the cart', (
    tester,
  ) async {
    await withStubbedNetworkImages(() async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await pumpApp(tester, container: container);
      expect(container.read(cartProvider), isEmpty);

      await tapAddToCart(tester);

      final cart = container.read(cartProvider);
      expect(cart.length, 1);
      expect(cart.single.quantity, 1);

      await tester.pumpAndSettle();
    });
  });

  testWidgets('tapping the same product twice increments quantity in the UI', (
    tester,
  ) async {
    await withStubbedNetworkImages(() async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await pumpApp(tester, container: container);

      await tapAddToCart(tester);
      await tester.pumpAndSettle();

      await tapAddToCart(tester);
      await tester.pumpAndSettle();

      final cart = container.read(cartProvider);
      expect(
        cart.length,
        1,
        reason: 'the same product must not duplicate rows',
      );
      expect(cart.single.quantity, 2);
      expect(cart.totalAmount, cart.single.price * 2);
    });
  });

  testWidgets('cart page shows the deduplicated line item and total', (
    tester,
  ) async {
    await withStubbedNetworkImages(() async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await pumpApp(tester, container: container);

      await tapAddToCart(tester);
      await tester.pumpAndSettle();
      await tapAddToCart(tester);
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      final item = container.read(cartProvider).single;
      expect(find.text(item.title), findsOneWidget);
      expect(find.text('${item.price}원 x 2개'), findsOneWidget);
      expect(find.text('총 금액: ${item.price * 2}원'), findsOneWidget);
    });
  });
}

class _FakeHttpClient implements HttpClient {
  @override
  bool autoUncompress = true;

  @override
  Future<HttpClientRequest> getUrl(Uri url) async =>
      _FakeHttpClientRequest(url);

  @override
  noSuchMethod(Invocation invocation) => null;
}

class _FakeHttpClientRequest implements HttpClientRequest {
  _FakeHttpClientRequest(this.uri);

  @override
  final Uri uri;

  @override
  final HttpHeaders headers = _FakeHttpHeaders();

  @override
  Future<HttpClientResponse> close() async => _FakeHttpClientResponse();

  @override
  Future<HttpClientResponse> get done async => _FakeHttpClientResponse();

  @override
  noSuchMethod(Invocation invocation) => null;
}

class _FakeHttpClientResponse implements HttpClientResponse {
  @override
  int get statusCode => HttpStatus.ok;

  @override
  int get contentLength => _transparentPixelPng.length;

  @override
  HttpClientResponseCompressionState get compressionState =>
      HttpClientResponseCompressionState.notCompressed;

  @override
  final HttpHeaders headers = _FakeHttpHeaders();

  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int> event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return Stream<List<int>>.value(_transparentPixelPng).listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }

  @override
  noSuchMethod(Invocation invocation) => null;
}

class _FakeHttpHeaders implements HttpHeaders {
  @override
  noSuchMethod(Invocation invocation) => null;
}

/// A 1x1 transparent PNG.
final Uint8List _transparentPixelPng = Uint8List.fromList(<int>[
  0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, //
  0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52,
  0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
  0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4,
  0x89, 0x00, 0x00, 0x00, 0x0A, 0x49, 0x44, 0x41,
  0x54, 0x78, 0x9C, 0x63, 0x00, 0x01, 0x00, 0x00,
  0x05, 0x00, 0x01, 0x0D, 0x0A, 0x2D, 0xB4, 0x00,
  0x00, 0x00, 0x00, 0x49, 0x45, 0x4E, 0x44, 0xAE,
  0x42, 0x60, 0x82,
]);
