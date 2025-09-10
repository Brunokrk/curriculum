import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_webapp/app/pages/home/home_controller.dart';
import 'package:portfolio_webapp/app/helpers/responsive_helper.dart';
import 'package:portfolio_webapp/app/theme/custom_theme.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveHelper.isMobile(context);
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.symmetric(
      //   vertical: isMobile ? 5 : 8,
      //   horizontal: 20,
      // ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isMobile ? 400 : 900,
          ),
          child: Consumer<HomeController>(
            builder: (context, homeController, child) {
              return isMobile 
                ? _buildMobileNavigation(context, l10n, homeController)
                : _buildWebNavigation(context, l10n, homeController);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMobileNavigation(
    BuildContext context, 
    AppLocalizations l10n, 
    HomeController homeController
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTabButton(
          context,
          l10n.information,
          Icons.person,
          homeController.isInformationTab,
          () => homeController.showInformationTab(),
        ),
        _buildTabButton(
          context,
          l10n.projects,
          Icons.work,
          homeController.isProjectsTab,
          () => homeController.showProjectsTab(),
        ),
      ],
    );
  }

  Widget _buildWebNavigation(
    BuildContext context, 
    AppLocalizations l10n, 
    HomeController homeController
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTabButton(
          context,
          l10n.information,
          Icons.person,
          homeController.isInformationTab,
          () => homeController.showInformationTab(),
        ),
        const SizedBox(width: 40),
        _buildTabButton(
          context,
          l10n.projects,
          Icons.work,
          homeController.isProjectsTab,
          () => homeController.showProjectsTab(),
        ),
      ],
    );
  }

  Widget _buildTabButton(
    BuildContext context,
    String label,
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected 
              ? CustomTheme.primaryColor.withOpacity(0.1)
              : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: isSelected 
                ? CustomTheme.primaryColor
                : CustomTheme.primaryColor.withOpacity(0.7),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              fontSize: 16,
              letterSpacing: 0.5,
            ) ?? const TextStyle(),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
