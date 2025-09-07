import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio_webapp/app/helpers/responsive_helper.dart';
import 'package:portfolio_webapp/app/theme/custom_theme.dart';
import 'dart:html' as html;

class CVDownloadSection extends StatelessWidget {
  const CVDownloadSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      width: double.infinity,
      color: CustomTheme.backgroundColor,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 60,
        horizontal: 20,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isMobile ? 400 : 900,
          ),
          child: Column(
            children: [
              Text(
                l10n.downloadCV,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: CustomTheme.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Divider(
                color: CustomTheme.secondaryColor,
                thickness: 0.1,
                indent: isMobile ? 50 : 100,
                endIndent: isMobile ? 50 : 100,
              ),
              const SizedBox(height: 30),
              isMobile ? _buildMobileButtons(context, l10n) : _buildDesktopButtons(context, l10n),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileButtons(BuildContext context, AppLocalizations l10n) {
    return Column(
      children: [
        _buildDownloadButton(
          context,
          l10n.downloadCVPortuguese,
          Icons.description,
          () => _downloadCV('portuguese'),
          true,
        ),
        const SizedBox(height: 16),
        _buildDownloadButton(
          context,
          l10n.downloadCVEnglish,
          Icons.description,
          () => _downloadCV('english'),
          true,
        ),
      ],
    );
  }

  Widget _buildDesktopButtons(BuildContext context, AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDownloadButton(
          context,
          l10n.downloadCVPortuguese,
          Icons.description,
          () => _downloadCV('portuguese'),
          false,
        ),
        const SizedBox(width: 30),
        _buildDownloadButton(
          context,
          l10n.downloadCVEnglish,
          Icons.description,
          () => _downloadCV('english'),
          false,
        ),
      ],
    );
  }

  Widget _buildDownloadButton(
    BuildContext context,
    String text,
    IconData icon,
    VoidCallback onPressed,
    bool isMobile,
  ) {
    return SizedBox(
      width: isMobile ? double.infinity : 200,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomTheme.primaryColor,
          foregroundColor: CustomTheme.secondaryColor,
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 16 : 20,
            horizontal: isMobile ? 20 : 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.2),
        ),
      ),
    );
  }

  void _downloadCV(String language) async {
    try {
      String pdfPath;
      String fileName;
      
      if (language == 'portuguese') {
        pdfPath = 'assets/cv/curriculo_pt.pdf';
        fileName = 'Bruno_Marchi_Pires_Curriculo_PT.pdf';
      } else {
        pdfPath = 'assets/cv/curriculo_en.pdf';
        fileName = 'Bruno_Marchi_Pires_CV_EN.pdf';
      }
      
      // Para Flutter Web, vamos usar o caminho correto dos assets
      // O Flutter Web serve os assets diretamente do diretório build/web/assets/
      String fullPath = 'assets/$pdfPath';
      
      // Criar um elemento anchor temporário para forçar o download
      final anchor = html.AnchorElement(href: fullPath)
        ..setAttribute('download', fileName)
        ..style.display = 'none';
      
      html.document.body?.children.add(anchor);
      anchor.click();
      html.document.body?.children.remove(anchor);
      
    } catch (e) {
      print('Erro ao fazer download do CV: $e');
      // Fallback: tentar abrir em nova aba
      try {
        String pdfPath = language == 'portuguese' 
            ? 'assets/cv/curriculo_pt.pdf' 
            : 'assets/cv/curriculo_en.pdf';
        html.window.open(pdfPath, '_blank');
      } catch (fallbackError) {
        print('Erro no fallback: $fallbackError');
        _showErrorDialog();
      }
    }
  }
  
  void _showErrorDialog() {
    // Esta função seria chamada em caso de erro
    // Por enquanto, apenas um print
    print('Erro ao fazer download do currículo');
  }
}
