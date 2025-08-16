// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const ProductListPage(),
      ),
    );
  }
}

class ProductListPage extends ConsumerStatefulWidget {
  const ProductListPage({super.key});

  @override
  ConsumerState<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends ConsumerState<ProductListPage> {
  final List<Product> _list = [
    Product(
      id: 'apple',
      title: 'Apple',
      summary: 'Fresh red apple',
      price: 1200,
      desc: """
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
API Dash is a beautiful open-source cross-platform API Client that can help you easily create & customize your API requests, visually inspect responses (full list of supported mime-types) and generate API integration code (full list) on the go.
""",
      color: Colors.red,
    ),
    Product(
      id: 'banana',
      title: 'Banana',
      summary: 'Sweet banana',
      price: 800,
      desc: 'Rich in potassium and perfect for breakfast',
      color: Colors.yellow,
    ),
    Product(
      id: 'orange',
      title: 'Orange',
      summary: 'Citrus orange',
      price: 1500,
      desc: 'Vitamin C rich orange for healthy lifestyle',
      color: Colors.orange,
    ),
    Product(
      id: 'grapes',
      title: 'Grapes',
      summary: 'Seedless grapes',
      price: 2000,
      desc: 'Sweet and seedless grapes perfect for snacking',
      color: Colors.purple,
    ),
    Product(
      id: 'watermelon',
      title: 'Watermelon',
      summary: 'Large watermelon',
      price: 5000,
      desc: 'Perfect for summer, juicy and refreshing watermelon',
      color: Colors.green,
    ),
    Product(
      id: 'strawberry',
      title: 'Strawberry',
      summary: 'Fresh strawberry',
      price: 2500,
      desc: 'Sweet and sour strawberry rich in vitamin C',
      color: Colors.pink,
    ),
    Product(
      id: 'peach',
      title: 'Peach',
      summary: 'Soft peach',
      price: 1800,
      desc: 'Soft and fragrant peach with sweet taste',
      color: Colors.yellow,
    ),
    Product(
      id: 'mango',
      title: 'Mango',
      summary: 'Tropical mango',
      price: 3000,
      desc: 'Sweet tropical mango full of flavor',
      color: Colors.amber,
    ),
    Product(
      id: 'blueberry',
      title: 'Blueberry',
      summary: 'Healthy blueberry',
      price: 3500,
      desc: 'Antioxidant-rich blueberry for healthy diet',
      color: Colors.blue,
    ),
    Product(
      id: 'pineapple',
      title: 'Pineapple',
      summary: 'Juicy pineapple',
      price: 4000,
      desc: 'Tropical and juicy pineapple with sweet taste',
      color: Colors.brown,
    ),
  ];

  void _showAddToCartAnimation(BuildContext context, Product product) {
    final RenderBox buttonRenderBox = context.findRenderObject() as RenderBox;
    final buttonPosition = buttonRenderBox.localToGlobal(Offset.zero);

    // 애니메이션 오버레이 표시
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      pageBuilder: (context, animation, secondaryAnimation) {
        return AddToCartAnimationOverlay(
          product: product,
          startPosition: buttonPosition,
          onAnimationComplete: () {
            Navigator.of(context).pop();
          },
        );
      },
      transitionDuration: const Duration(milliseconds: 1000),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상품 목록'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final cartItemCount = ref.watch(cartItemCountProvider);
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                  ),
                  if (cartItemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$cartItemCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: Center(
        child: CardSwiper(
          cardBuilder:
              (
                context,
                index,
                horizontalOffsetPercentage,
                verticalOffsetPercentage,
              ) {
                var product = _list[index];

                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailPage(product: product),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: product.color,
                          ),

                          child: Column(
                            children: [
                              const SizedBox(height: 5),
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(10),
                                child: Image.network(
                                  width: 200,
                                  height: 200,
                                  'https://media.istockphoto.com/id/532048136/ko/%EC%82%AC%EC%A7%84/%EC%8B%A0%EC%84%A0%ED%95%9C-%EB%A0%88%EB%93%9C-%EC%82%AC%EA%B3%BC%EB%82%98%EB%AC%B4-%ED%9D%B0%EC%83%89-%EB%B0%94%ED%83%95%EC%97%90-%EA%B7%B8%EB%A6%BC%EC%9E%90%EC%99%80-%ED%81%B4%EB%A6%AC%ED%95%91-%EA%B2%BD%EB%A1%9C%EB%A5%BC-%ED%86%B5%ED%95%B4.jpg?s=1024x1024&w=is&k=20&c=tGdr_JYRW035yWh43Mcbbe-CDndzOt2l5QkDYV4LxZ0=',
                                ),
                              ),
                              Text(
                                product.title,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(product.summary),
                              Text(product.price.toString()),
                              ElevatedButton(
                                onPressed: () async {
                                  // 장바구니에 상품 추가
                                  ref
                                      .read(cartProvider.notifier)
                                      .addItem(
                                        product.id,
                                        product.title,
                                        product.price,
                                        product.color,
                                      );

                                  // 애니메이션 시작
                                  _showAddToCartAnimation(context, product);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '${product.title}이(가) 장바구니에 추가되었습니다!',
                                      ),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                                child: const Text('장바구니에 담기'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
          cardsCount: _list.length,
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SafeArea(
        child: Column(
          children: [
            Image.network(
              'https://media.istockphoto.com/id/532048136/ko/%EC%82%AC%EC%A7%84/%EC%8B%A0%EC%84%A0%ED%95%9C-%EB%A0%88%EB%93%9C-%EC%82%AC%EA%B3%BC%EB%82%98%EB%AC%B4-%ED%9D%B0%EC%83%89-%EB%B0%94%ED%83%95%EC%97%90-%EA%B7%B8%EB%A6%BC%EC%9E%90%EC%99%80-%ED%81%B4%EB%A6%AC%ED%95%91-%EA%B2%BD%EB%A1%9C%EB%A5%BC-%ED%86%B5%ED%95%B4.jpg?s=1024x1024&w=is&k=20&c=tGdr_JYRW035yWh43Mcbbe-CDndzOt2l5QkDYV4LxZ0=',
            ),
            Expanded(child: SingleChildScrollView(child: Text(product.desc))),
            TextButton(
              onPressed: () {},
              child: Text('${product.price}원에 구입하기'),
            ),
          ],
        ),
      ),
    );
  }
}

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
      body: Builder(
        builder: (context) {
          if (cart.isEmpty) {
            return const Center(
              child: Text('장바구니가 비어있습니다.', style: TextStyle(fontSize: 18)),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart.values.toList()[index];
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
                      '총 금액: ${ref.watch(cartTotalAmountProvider)}원',
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
          );
        },
      ),
    );
  }
}

class Product {
  final String id;
  final String title;
  final String summary;
  final int price;
  final String desc;
  final Color color;

  Product({
    required this.id,
    required this.title,
    required this.summary,
    required this.price,
    required this.desc,
    required this.color,
  });
}

class AddToCartAnimationOverlay extends StatefulWidget {
  final Product product;
  final Offset startPosition;
  final VoidCallback onAnimationComplete;

  const AddToCartAnimationOverlay({
    super.key,
    required this.product,
    required this.startPosition,
    required this.onAnimationComplete,
  });

  @override
  State<AddToCartAnimationOverlay> createState() =>
      _AddToCartAnimationOverlayState();
}

class _AddToCartAnimationOverlayState extends State<AddToCartAnimationOverlay>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _scaleController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    // 슬라이드 애니메이션 (버튼에서 장바구니로)
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(2.0, -1.0), // 오른쪽 위로 이동
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // 스케일 애니메이션
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // 페이드 애니메이션
    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // 애니메이션 시작
    _startAnimation();
  }

  void _startAnimation() async {
    // 스케일 애니메이션 먼저 시작
    await _scaleController.forward();

    // 슬라이드 애니메이션 시작
    _controller.forward();

    // 애니메이션 완료 후 콜백 실행
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 200), () {
          widget.onAnimationComplete();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // 애니메이션되는 상품 아이콘
          AnimatedBuilder(
            animation: Listenable.merge([_controller, _scaleController]),
            builder: (context, child) {
              return Positioned(
                left: widget.startPosition.dx + 50, // 버튼 중앙에서 시작
                top: widget.startPosition.dy - 20,
                child: Transform.translate(
                  offset: _slideAnimation.value * 100,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Opacity(
                      opacity: _fadeAnimation.value,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: widget.product.color,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            widget.product.title[0],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
