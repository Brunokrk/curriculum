import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio_webapp/app/widgets/experiences_section.dart';
import 'package:portfolio_webapp/app/widgets/footer.dart';
import 'package:portfolio_webapp/app/widgets/generic_section.dart';
import 'package:portfolio_webapp/app/widgets/language_selector.dart';

import 'package:portfolio_webapp/app/theme/custom_theme.dart';
import 'package:portfolio_webapp/app/widgets/drawer_list_tile.dart';
import 'package:portfolio_webapp/app/widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _headerKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _graduationKey = GlobalKey();
  final GlobalKey _experiencesKey = GlobalKey();
  // Função para fazer scroll para uma seção específica
  void _scrollToSection(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        alignment: 0.0, // Alinha ao topo da tela
      );
    }
    // Fecha o drawer após clicar
    Navigator.of(context).pop();
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
      drawer: Drawer(
        child: Column(
          children: [
            DrawerListTile(
                title: l10n.home, onTap: () => _scrollToSection(_headerKey)),
            DrawerListTile(
                title: l10n.about, onTap: () => _scrollToSection(_aboutKey)),
            DrawerListTile(
                title: l10n.graduation,
                onTap: () => _scrollToSection(_graduationKey)),
            DrawerListTile(
                title: l10n.experiences,
                onTap: () => _scrollToSection(_experiencesKey)),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(key: _headerKey),
              GenericSection(
                key: _aboutKey,
                title: l10n.about,
                content: l10n.aboutContent,
                showDivider: true,
                dividerIndent: 100,
                dividerEndIndent: 100,
              ),
              GenericSection(
                key: _graduationKey,
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
              ExperiencesSection(key: _experiencesKey),

              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
