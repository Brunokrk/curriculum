import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_webapp/app/helpers/language_notifier.dart';
import 'package:portfolio_webapp/app/theme/custom_theme.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final languageNotifier = Provider.of<LanguageNotifier>(context);
    
    return PopupMenuButton<Locale>(
      icon: Icon(
        Icons.language,
        color: CustomTheme.secondaryColor,
      ),
      tooltip: l10n.language,
      onSelected: (Locale locale) async {
        await languageNotifier.changeLanguage(locale);
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<Locale>(
          value: const Locale('pt', 'BR'),
          child: Row(
            children: [
              const Text('🇧🇷'),
              const SizedBox(width: 8),
              Text(l10n.portuguese),
              if (languageNotifier.isPortuguese) ...[
                const Spacer(),
                Icon(
                  Icons.check,
                  color: CustomTheme.primaryColor,
                  size: 20,
                ),
              ],
            ],
          ),
        ),
        PopupMenuItem<Locale>(
          value: const Locale('en', 'US'),
          child: Row(
            children: [
              const Text('🇺🇸'),
              const SizedBox(width: 8),
              Text(l10n.english),
              if (languageNotifier.isEnglish) ...[
                const Spacer(),
                Icon(
                  Icons.check,
                  color: CustomTheme.primaryColor,
                  size: 20,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
