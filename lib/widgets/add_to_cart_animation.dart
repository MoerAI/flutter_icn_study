import 'package:flutter/material.dart';
import '../models/product.dart';

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
