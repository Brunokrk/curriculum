import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio_webapp/app/helpers/responsive_helper.dart';
import 'package:portfolio_webapp/app/theme/custom_theme.dart';
import 'package:portfolio_webapp/app/widgets/photo_box.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveHelper.isMobile(context);
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      width: double.infinity,
      color: CustomTheme.primaryColor,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 80, 
        horizontal: 20
      ),
      child: isMobile
          ? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const PhotoBox(
                  photo: 'assets/images/dev_photo.jpg',
                  borderColor: Colors.white,
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.headerGreeting,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(
                        color: CustomTheme.secondaryColor,
                        fontSize: isMobile ? 18 : 24,
                        fontWeight: FontWeight.w300,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.headerName,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: CustomTheme.secondaryColor, 
                    fontSize: isMobile ? 32 : 48,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.headerTitle,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: CustomTheme.secondaryColor.withOpacity(0.9), 
                    fontSize: isMobile ? 16 : 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: const PhotoBox(
                      photo: 'assets/images/dev_photo.jpg',
                      borderColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 60),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.headerGreeting,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                              color: CustomTheme.secondaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        l10n.headerName,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                              color: CustomTheme.secondaryColor,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.headerTitle,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                              color: CustomTheme.secondaryColor.withOpacity(0.9),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
