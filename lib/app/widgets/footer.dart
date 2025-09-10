import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio_webapp/app/helpers/responsive_helper.dart';
import 'package:portfolio_webapp/app/theme/custom_theme.dart';
import 'package:url_launcher/url_launcher.dart';

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
        SelectableText(
          l10n.developedBy,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: CustomTheme.primaryColor,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        _buildContactCard(context, l10n, true),
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
          child: SelectableText(
            l10n.developedBy,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: CustomTheme.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: _buildContactCard(context, l10n, false),
        ),
      ],
    );
  }

  Widget _buildContactCard(BuildContext context, AppLocalizations l10n, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomTheme.primaryColor.withOpacity(0.1),
            CustomTheme.primaryColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: CustomTheme.primaryColor.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: CustomTheme.primaryColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Icon(
                Icons.contact_page,
                color: CustomTheme.primaryColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                l10n.contacts,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: CustomTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Seção de Contato Direto
          _buildContactSection(context, l10n, isMobile),
          
          const SizedBox(height: 16),
          
          // Divisor
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  CustomTheme.primaryColor.withOpacity(0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Seção de Redes Sociais
          _buildSocialSection(context, l10n, isMobile),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context, AppLocalizations l10n, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        _buildContactItem(
          context,
          l10n.phone,
          l10n.phoneNumber,
          Icons.phone_rounded,
          isMobile,
        ),
        const SizedBox(height: 12),
        _buildContactItem(
          context,
          l10n.email,
          l10n.emailAddress,
          Icons.email_rounded,
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
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: CustomTheme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 16,
            color: CustomTheme.primaryColor,
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Column(
            crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: CustomTheme.primaryColor.withOpacity(0.7),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              SelectableText(
                value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: CustomTheme.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialSection(BuildContext context, AppLocalizations l10n, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Redes Sociais',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: CustomTheme.primaryColor.withOpacity(0.8),
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 12,
          runSpacing: 8,
          children: [
            _buildSocialButton(
              context,
              l10n.github,
              'https://github.com/Brunokrk',
              Icons.code_rounded,
            ),
            _buildSocialButton(
              context,
              l10n.linkedin,
              'https://www.linkedin.com/in/bruno-marchi-pires-734336201/',
              Icons.work_rounded,
            ),
            _buildSocialButton(
              context,
              l10n.instagram,
              'https://www.instagram.com/brunokrk/',
              Icons.camera_alt_rounded,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    String label,
    String url,
    IconData icon,
  ) {
    return InkWell(
      onTap: () => _launchUrl(url),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: CustomTheme.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: CustomTheme.primaryColor.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: CustomTheme.primaryColor,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: CustomTheme.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}