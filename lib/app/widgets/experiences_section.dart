import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio_webapp/app/helpers/constants.dart';
import 'package:portfolio_webapp/app/helpers/responsive_helper.dart';
import 'package:portfolio_webapp/app/theme/custom_theme.dart';

class ExperiencesSection extends StatefulWidget {
  const ExperiencesSection({super.key});

  @override
  State<ExperiencesSection> createState() => _ExperiencesSectionState();
}

class _ExperiencesSectionState extends State<ExperiencesSection> {
  final Map<int, bool> _expandedStates = {};

  @override
    Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    bool isMobile = ResponsiveHelper.isMobile(context);
    return Container(
      width: double.infinity,
      color: CustomTheme.backgroundColor,
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
          l10n.experiences,
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(color: CustomTheme.secondaryColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Divider(
          color: CustomTheme.secondaryColor,
          thickness: 0.1,
          indent: 50,
          endIndent: 50,
        ),
        const SizedBox(height: 20),
        ...Constants().experiences.asMap().entries.map((entry) {
          final index = entry.key;
          final experience = entry.value;
          return _buildExperienceItem(context, experience, index, l10n);
        }).toList(),
      ],
    );
  }

  Widget _buildWeb(BuildContext context, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          l10n.experiences,
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(color: CustomTheme.secondaryColor),
        ),
        const SizedBox(height: 8),
        Divider(
          color: CustomTheme.secondaryColor,
          thickness: 0.1,
          indent: 100,
          endIndent: 100,
        ),
        const SizedBox(height: 20),
        ...Constants().experiences.asMap().entries.map((entry) {
          final index = entry.key;
          final experience = entry.value;
          return _buildExperienceItem(context, experience, index, l10n);
        }).toList(),
      ],
    );
  }

  Widget _buildExperienceItem(BuildContext context, Map<String, String> experience, int index, AppLocalizations l10n) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isExpanded = _expandedStates[index] ?? false;
    final content = experience['content']!;
    
    // Determina se o texto é longo o suficiente para precisar do botão "Ler mais"
    final needsReadMore = content.length > 500;
    
    return Container(
      margin: EdgeInsets.only(
        bottom: index < Constants().experiences.length - 1 ? 40 : 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo da empresa
          Container(
            width: isMobile ? 60 : 80,
            height: isMobile ? 60 : 80,
            margin: EdgeInsets.only(right: isMobile ? 16 : 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: CustomTheme.secondaryColor.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: Image.asset(
                experience['assetPath']!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Conteúdo da experiência
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cargo e empresa
                SelectableText(
                  _getLocalizedPosition(experience['position']!, l10n),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: CustomTheme.secondaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: SelectableText(
                        experience['company']!,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: CustomTheme.secondaryColor.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SelectableText(
                      _getLocalizedPeriod(experience['company']!, l10n),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: CustomTheme.secondaryColor.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Descrição com botão "Ler mais"
                _buildExpandableText(context, _getLocalizedContent(experience['content']!, l10n), index, isExpanded, needsReadMore, isMobile, l10n),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableText(BuildContext context, String content, int index, bool isExpanded, bool needsReadMore, bool isMobile, AppLocalizations l10n) {
    if (!needsReadMore) {
      return SelectableText(
        content,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          height: 1.6,
          fontSize: isMobile ? 14 : 16,
        ),
      );
    }

    final displayText = isExpanded ? content : content.substring(0, 500) + '...';
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SelectableText(
              displayText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.6,
                fontSize: isMobile ? 14 : 16,
              ),
            ),
            if (!isExpanded)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        CustomTheme.backgroundColor.withOpacity(0.0),
                        CustomTheme.backgroundColor.withOpacity(0.3),
                        CustomTheme.backgroundColor.withOpacity(0.7),
                        CustomTheme.backgroundColor,
                      ],
                      stops: const [0.0, 0.3, 0.7, 1.0],
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _expandedStates[index] = true;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          l10n.readMore,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: CustomTheme.secondaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _expandedStates[index] = false;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    l10n.readLess,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: CustomTheme.secondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  String _getLocalizedPosition(String position, AppLocalizations l10n) {
    if (position.contains('BMPTec') || position.contains('Desenvolvedor de Software Mobile')) {
      return l10n.bmptecPosition;
    } else if (position.contains('TOTVS') || position.contains('Estagiário')) {
      return l10n.totvsPosition;
    }
    return position;
  }

  String _getLocalizedContent(String content, AppLocalizations l10n) {
    if (content.contains('BMPTec') || content.contains('white label')) {
      return l10n.bmptecContent;
    } else if (content.contains('TOTVS') || content.contains('internacional')) {
      return l10n.totvsContent;
    }
    return content;
  }

  String _getLocalizedPeriod(String company, AppLocalizations l10n) {
    if (company.contains('BMPTec')) {
      return l10n.bmptecPeriod;
    } else if (company.contains('TOTVS')) {
      return l10n.totvsPeriod;
    }
    return '';
  }

}