import 'package:flutter/material.dart';

class ProjectImageGallery extends StatefulWidget {
  final List<String> images;
  final String? fallbackImage;

  const ProjectImageGallery({
    super.key,
    required this.images,
    this.fallbackImage,
  });

  @override
  State<ProjectImageGallery> createState() => _ProjectImageGalleryState();
}

class _ProjectImageGalleryState extends State<ProjectImageGallery> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Calcula quantas imagens cabem na tela
  int _getImagesPerRow(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) return 4; // Desktop grande
    if (screenWidth > 900) return 3;  // Desktop médio
    if (screenWidth > 600) return 2;  // Tablet
    return 1; // Mobile
  }

  // Verifica se deve usar carrossel ou grid
  bool _shouldUseCarousel(BuildContext context) {
    final imagesPerRow = _getImagesPerRow(context);
    return widget.images.length > imagesPerRow;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty && widget.fallbackImage == null) {
      return _buildPlaceholder();
    }

    return Container(
      height: 300,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: Container(
          color: Colors.grey[100],
          child: _shouldUseCarousel(context) 
              ? _buildCarouselView(context)
              : _buildGridView(context),
        ),
      ),
    );
  }

  Widget _buildGridView(BuildContext context) {
    final imagesPerRow = _getImagesPerRow(context);
    final imagesToShow = widget.images.take(imagesPerRow).toList();
    
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: imagesToShow.map((imagePath) => 
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return _buildErrorWidget();
                },
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }

  Widget _buildCarouselView(BuildContext context) {
    return Stack(
      children: [
      
        PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            final imagePath = widget.images[index];
            
            return Container(
              width: double.infinity,
              height: 300,
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                    maxHeight: 300,
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildErrorWidget();
                    },
                  ),
                ),
              ),
            );
          },
        ),
        
        // Indicadores de página
        if (widget.images.length > 1) _buildPageIndicators(),
        
        // Botões de navegação
        if (widget.images.length > 1) _buildNavigationButtons(),
      ],
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Icon(
        Icons.image,
        size: 64,
        color: Colors.grey[400],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Icon(
        Icons.broken_image,
        size: 64,
        color: Colors.grey[400],
      ),
    );
  }

  Widget _buildPageIndicators() {
    return Positioned(
      bottom: 12,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.images.length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == index
                  ? Colors.grey[800]
                  : Colors.grey[400],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Stack(
      children: [
        // Botão anterior (esquerda)
        Positioned(
          left: 8,
          top: 0,
          bottom: 0,
          child: Center(
            child: _buildNavigationButton(
              icon: Icons.chevron_left,
              isEnabled: _currentIndex > 0,
              onPressed: _currentIndex > 0
                  ? () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  : null,
            ),
          ),
        ),
        
        // Botão próximo (direita)
        Positioned(
          right: 8,
          top: 0,
          bottom: 0,
          child: Center(
            child: _buildNavigationButton(
              icon: Icons.chevron_right,
              isEnabled: _currentIndex < widget.images.length - 1,
              onPressed: _currentIndex < widget.images.length - 1
                  ? () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    required bool isEnabled,
    required VoidCallback? onPressed,
  }) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isEnabled 
            ? Colors.black.withOpacity(0.7)
            : Colors.grey.withOpacity(0.3),
        shape: BoxShape.circle,
        border: Border.all(
          color: isEnabled 
              ? Colors.black.withOpacity(0.3)
              : Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          icon,
          color: isEnabled 
              ? Colors.white
              : Colors.grey[400],
          size: 20,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
