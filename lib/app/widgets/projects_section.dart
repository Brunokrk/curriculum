import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio_webapp/app/helpers/responsive_helper.dart';
import 'package:portfolio_webapp/app/helpers/constants.dart';
import 'package:portfolio_webapp/app/models/project.dart';
import 'package:portfolio_webapp/app/theme/custom_theme.dart';
import 'package:portfolio_webapp/app/widgets/project_card.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String _searchQuery = '';
  List<String> _selectedTechnologies = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isMobile = ResponsiveHelper.isMobile(context);
    final allProjects = Constants.getProjects(l10n);
    final filteredProjects = _filterProjects(allProjects);
    
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
              
              // Filtros
              _buildFiltersSection(context, isMobile, l10n),
              
              const SizedBox(height: 30),
              
              // Lista de projetos filtrados
              if (filteredProjects.isEmpty)
                _buildNoResultsWidget(context)
              else
                ...filteredProjects.map((project) => ProjectCard(
                  project: project,
                  l10n: l10n,
                )).toList(),
            ],
          ),
        ),
      ),
    );
  }


  List<Project> _filterProjects(List<Project> projects) {
    return projects.where((project) {
      // Filtro por nome/descrição
      final matchesSearch = _searchQuery.isEmpty ||
          project.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          project.description.toLowerCase().contains(_searchQuery.toLowerCase());
      
      // Filtro por tecnologias
      final matchesTechnologies = _selectedTechnologies.isEmpty ||
          _selectedTechnologies.any((tech) => project.technologies.contains(tech));
      
      return matchesSearch && matchesTechnologies;
    }).toList();
  }

  Widget _buildFiltersSection(BuildContext context, bool isMobile, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Campo de busca
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Buscar projetos...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _searchQuery = '';
                          _searchController.clear();
                        });
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
          
          const SizedBox(height: 16),
          
          // Filtros de tecnologia
          Text(
            'Filtrar por tecnologia:',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          
          const SizedBox(height: 8),
          
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: Constants.getAllTechnologies(l10n).map((tech) {
              final isSelected = _selectedTechnologies.contains(tech);
              return FilterChip(
                label: Text(
                  tech,
                  style: TextStyle(
                    color: isSelected ? Colors.black87 : Colors.grey[700],
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedTechnologies.add(tech);
                    } else {
                      _selectedTechnologies.remove(tech);
                    }
                  });
                },
                selectedColor: CustomTheme.primaryColor.withOpacity(0.3),
                checkmarkColor: CustomTheme.secondaryColor,
                backgroundColor: Colors.grey[100],
                side: BorderSide(
                  color: isSelected ? CustomTheme.primaryColor : Colors.grey[300]!,
                  width: isSelected ? 2 : 1,
                ),
              );
            }).toList(),
          ),
          
          // Botão limpar filtros
          if (_selectedTechnologies.isNotEmpty || _searchQuery.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    _searchQuery = '';
                    _searchController.clear();
                    _selectedTechnologies.clear();
                  });
                },
                icon: const Icon(Icons.clear_all, color: CustomTheme.secondaryColor,),
                label: const Text('Limpar filtros', style: TextStyle(color: CustomTheme.secondaryColor),),
                
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNoResultsWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Nenhum projeto encontrado',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tente ajustar os filtros de busca',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}

