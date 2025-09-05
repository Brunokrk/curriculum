import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio_webapp/app/helpers/responsive_helper.dart';
import 'package:portfolio_webapp/app/theme/custom_theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      color: CustomTheme.secondaryColor,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isMobile ? 400 : 900,
          ),
          child: isMobile ? _buildMobile(context, l10n) : _buildWeb(context, l10n),
        ),
      ),
    );
  }

  Widget _buildMobile(BuildContext context, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          l10n.developedBy,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: CustomTheme.primaryColor,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        _buildContactInfo(context, l10n, true),
      ],
    );
  }

  Widget _buildWeb(BuildContext context, AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            l10n.developedBy,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: CustomTheme.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: _buildContactInfo(context, l10n, false),
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context, AppLocalizations l10n, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        _buildContactItem(
          context,
          l10n.phone,
          l10n.phoneNumber,
          Icons.phone,
          isMobile,
        ),
        const SizedBox(height: 8),
        _buildContactItem(
          context,
          l10n.email,
          l10n.emailAddress,
          Icons.email,
          isMobile,
        ),
      ],
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    bool isMobile,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 16,
          color: CustomTheme.primaryColor.withOpacity(0.7),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: CustomTheme.primaryColor.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: CustomTheme.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}