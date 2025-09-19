import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio_webapp/app/helpers/responsive_helper.dart';
import 'package:portfolio_webapp/app/models/project.dart';
import 'package:portfolio_webapp/app/theme/custom_theme.dart';
import 'package:portfolio_webapp/app/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      width: double.infinity,
      color: CustomTheme.backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isMobile ? 400 : 900,
          ),
          child: Column(
            children: [
              // Título da seção
              Text(
                l10n.projects,
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
              const SizedBox(height: 40),
              
              // Lista de projetos
              ..._getProjects(l10n).map((project) => ProjectCard(
                project: project,
                l10n: l10n,
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }

  List<Project> _getProjects(AppLocalizations l10n) {
    return [
      Project(
        id: '1',
        title: l10n.listinTitle,
        description: l10n.listinDescription,
        images: const [
          'assets/listin/login.jpg',
          'assets/listin/home.jpg',
          'assets/listin/add_produto.jpg',
          'assets/listin/add_produto_2.jpg',
          'assets/listin/altera_produto.jpg',
          'assets/listin/ordenacao.jpg',
          'assets/listin/hamburguer.jpg',
        ],
        technologies: const ['Flutter', 'Dart', 'Firebase', 'Figma'],
        status: ProjectStatus.completed,
        githubUrl: 'https://github.com/Brunokrk/Learning_Firebase_with_Flutter/tree/main',
      ),
    ];
  }
}

