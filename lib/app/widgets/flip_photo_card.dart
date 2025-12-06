import 'package:flutter/material.dart';

class FlipPhotoCard extends StatefulWidget {
  final String photo;
  final String avatar;
  final Color borderColor;
  final double? size;

  const FlipPhotoCard({
    super.key,
    required this.photo,
    required this.avatar,
    required this.borderColor,
    this.size,
  });

  @override
  State<FlipPhotoCard> createState() => _FlipPhotoCardState();
}

class _FlipPhotoCardState extends State<FlipPhotoCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleFlip() {
    setState(() {
      _isFlipped = !_isFlipped;
      if (_isFlipped) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final cardSize = widget.size ?? (screenSize.width < 600 ? 220.0 : 250.0);

    return GestureDetector(
      onTap: _toggleFlip,
      child: MouseRegion(
        onEnter: (_) {
          if (!_isFlipped) {
            _toggleFlip();
          }
        },
        onExit: (_) {
          if (_isFlipped) {
            _toggleFlip();
          }
        },
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return _buildCard(cardSize);
          },
        ),
      ),
    );
  }

  Widget _buildCard(double size) {
    final angle = _animation.value * 3.14159; // π radians = 180 graus
    final isFrontVisible = _animation.value < 0.5;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // Perspectiva 3D
        ..rotateY(angle),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: widget.borderColor,
            width: 4.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Face frontal (foto)
              _buildFace(
                widget.photo,
                size,
                visible: isFrontVisible,
              ),
              // Face traseira (avatar) - rotacionada 180° no eixo Y
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(3.14159),
                child: _buildFace(
                  widget.avatar,
                  size,
                  visible: !isFrontVisible,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFace(String imagePath, double size, {required bool visible}) {
    return IgnorePointer(
      ignoring: !visible,
      child: Opacity(
        opacity: visible ? 1.0 : 0.0,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: size,
          height: size,
        ),
      ),
    );
  }
}
