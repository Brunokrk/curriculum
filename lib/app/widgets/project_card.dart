import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio_webapp/app/helpers/responsive_helper.dart';
import 'package:portfolio_webapp/app/models/project.dart';
import 'package:portfolio_webapp/app/widgets/project_image_gallery.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final AppLocalizations l10n;

  const ProjectCard({
    super.key,
    required this.project,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagem do projeto
          if (project.images.isNotEmpty || project.imagePath != null) _buildProjectImage(),
          
          // Conteúdo do card
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título e status
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        project.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildStatusChip(),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                // Descrição
                Text(
                  project.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                    height: 1.6,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Tecnologias
                _buildTechnologiesSection(context),
                
                const SizedBox(height: 16),
                
                // Botões de ação
                _buildActionButtons(context, isMobile),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectImage() {
    return ProjectImageGallery(
      images: project.images,
      fallbackImage: project.imagePath,
    );
  }

  Widget _buildStatusChip() {
    Color statusColor;
    switch (project.status) {
      case ProjectStatus.completed:
        statusColor = Colors.green;
        break;
      case ProjectStatus.inProgress:
        statusColor = Colors.orange;
        break;
      case ProjectStatus.planned:
        statusColor = Colors.blue;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: statusColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        project.status.displayName,
        style: TextStyle(
          color: statusColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTechnologiesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.technologies,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey[700],
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: project.technologies.map((tech) => _buildTechChip(tech)).toList(),
        ),
      ],
    );
  }

  Widget _buildTechChip(String technology) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.blue[200]!,
          width: 1,
        ),
      ),
      child: Text(
        technology,
        style: TextStyle(
          color: Colors.blue[700],
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, bool isMobile) {
    return Row(
      children: [
        if (project.githubUrl != null)
          Expanded(
            child: _buildActionButton(
              context: context,
              label: 'GitHub',
              icon: Icons.code,
              onTap: () => _launchUrl(project.githubUrl!),
            ),
          ),
        if (project.githubUrl != null && project.liveUrl != null)
          const SizedBox(width: 12),
        if (project.liveUrl != null)
          Expanded(
            child: _buildActionButton(
              context: context,
              label: l10n.viewProject,
              icon: Icons.open_in_new,
              onTap: () => _launchUrl(project.liveUrl!),
              isPrimary: true,
            ),
          ),
      ],
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required VoidCallback onTap,
    bool isPrimary = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isPrimary 
            ? Colors.blue[600] 
            : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isPrimary 
              ? Colors.blue[600]! 
              : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isPrimary 
                ? Colors.white 
                : Colors.grey[700],
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isPrimary 
                  ? Colors.white 
                  : Colors.grey[700],
                fontWeight: FontWeight.w600,
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

