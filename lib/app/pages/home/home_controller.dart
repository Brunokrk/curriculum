import 'package:flutter/material.dart';

enum HomePageTab {
  information,
  projects,
}

class HomeController extends ChangeNotifier {
  // Estado de navegação
  HomePageTab _currentTab = HomePageTab.information;

  final GlobalKey _headerKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _graduationKey = GlobalKey();
  final GlobalKey _experiencesKey = GlobalKey();

  //estado de navegação
  HomePageTab get currentTab => _currentTab;
  bool get isInformationTab => _currentTab == HomePageTab.information;
  bool get isProjectsTab => _currentTab == HomePageTab.projects;


  GlobalKey get headerKey => _headerKey;
  GlobalKey get aboutKey => _aboutKey;
  GlobalKey get graduationKey => _graduationKey;
  GlobalKey get experiencesKey => _experiencesKey;


  void setCurrentTab(HomePageTab tab) {
    if (_currentTab != tab) {
      _currentTab = tab;
      notifyListeners();
    }
  }

  void scrollToSection(GlobalKey key, BuildContext context) {
    // Verifica se a seção está na aba de informações
    bool isInformationSection = key == _aboutKey || 
                               key == _graduationKey || 
                               key == _experiencesKey;
    
    // Se estiver na aba de projetos e a seção for de informações, troca para informações
    if (!isInformationTab && isInformationSection) {
      showInformationTab();
    }
    
    // Aguarda um frame para garantir que a UI foi atualizada
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? renderBox =
          key.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        Scrollable.ensureVisible(
          key.currentContext!,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          alignment: 0.0, 
        );
      }
    });
    
    // Fecha o drawer após clicar
    Navigator.of(context).pop();
  }

  bool isSectionVisible(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return false;
    
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    
    return position.dy < MediaQuery.of(key.currentContext!).size.height &&
           position.dy + size.height > 0;
  }

  String getCurrentSectionName() {
    return isInformationTab ? 'Informações' : 'Projetos';
  }

  void scrollToTop(ScrollController scrollController) {
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }


//toggle tabs
  void showInformationTab() {
    setCurrentTab(HomePageTab.information);
  }

  void showProjectsTab() {
    setCurrentTab(HomePageTab.projects);
  }

  @override
  void dispose() {
    super.dispose();
  }
}