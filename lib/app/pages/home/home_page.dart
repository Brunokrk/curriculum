import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_webapp/app/pages/home/home_controller.dart';
import 'package:portfolio_webapp/app/widgets/experiences_section.dart';
import 'package:portfolio_webapp/app/widgets/footer.dart';
import 'package:portfolio_webapp/app/widgets/generic_section.dart';
import 'package:portfolio_webapp/app/widgets/language_selector.dart';
import 'package:portfolio_webapp/app/widgets/cv_download_section.dart';
import 'package:portfolio_webapp/app/widgets/navigation_bar.dart';

import 'package:portfolio_webapp/app/theme/custom_theme.dart';
import 'package:portfolio_webapp/app/widgets/drawer_list_tile.dart';
import 'package:portfolio_webapp/app/widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.primaryColor,
        iconTheme: IconThemeData(color: CustomTheme.secondaryColor),
        actions: const [
          LanguageSelector(),
          SizedBox(width: 16),
        ],
      ),
      drawer: Consumer<HomeController>(
        builder: (context, homeController, child) {
          return Drawer(
            child: Column(
              children: [
                DrawerListTile(
                  title: l10n.home, 
                  onTap: () => homeController.scrollToSection(homeController.headerKey, context),
                ),
                DrawerListTile(
                  title: l10n.about, 
                  onTap: () => homeController.scrollToSection(homeController.aboutKey, context),
                ),
                DrawerListTile(
                  title: l10n.graduation,
                  onTap: () => homeController.scrollToSection(homeController.graduationKey, context),
                ),
                DrawerListTile(
                  title: l10n.experiences,
                  onTap: () => homeController.scrollToSection(homeController.experiencesKey, context),
                ),
              ],
            ),
          );
        },
      ),
      body: SafeArea(
        child: Consumer<HomeController>(
          builder: (context, homeController, child) {
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                // Header como sliver
                SliverToBoxAdapter(
                  child: Header(key: homeController.headerKey),
                ),
                // NavBar sticky
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _NavigationBarDelegate(
                    child: const CustomNavigationBar(),
                  ),
                ),
                // Conteúdo das tabs
                SliverToBoxAdapter(
                  child: homeController.isInformationTab
                    ? _buildPersonalHomePage(l10n, homeController)
                    : _buildProjectsHomePage(l10n),
                ),
                // Footer
                SliverToBoxAdapter(
                  child: Footer(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }


  Widget _buildPersonalHomePage(AppLocalizations l10n, HomeController homeController) {
    return Column(
      children: [
        CVDownloadSection(),
        GenericSection(
          key: homeController.aboutKey,
          title: l10n.about,
          content: l10n.aboutContent,
          showDivider: true,
          dividerIndent: 100,
          dividerEndIndent: 100,
        ),
        GenericSection(
          key: homeController.graduationKey,
          title: l10n.graduation,
          content: l10n.graduationContent,
          photo: 'assets/images/Marca_Udesc.jpg',
          photoBorderColor: CustomTheme.secondaryColor,
          photoWidth: 250,
          contentAlignment: CrossAxisAlignment.center,
          showDivider: true,
          dividerIndent: 100,
          dividerEndIndent: 100,
        ),
        ExperiencesSection(key: homeController.experiencesKey),
      ],
    );
  }

  Widget _buildProjectsHomePage(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              Text(
                l10n.projects,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: CustomTheme.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: CustomTheme.secondaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: CustomTheme.secondaryColor.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.construction,
                      size: 64,
                      color: CustomTheme.secondaryColor.withOpacity(0.5),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Em breve...',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: CustomTheme.secondaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Esta seção será atualizada em breve com meus projetos.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: CustomTheme.secondaryColor.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _NavigationBarDelegate({required this.child});

  @override
  double get minExtent => 50;

  @override
  double get maxExtent => 50;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: CustomTheme.secondaryColor,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

