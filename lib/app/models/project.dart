class Project {
  final String id;
  final String title;
  final String description;
  final String? imagePath;
  final List<String> images;
  final String? githubUrl;
  final String? otherUrl;
  final String? liveUrl;
  final List<String> technologies;
  final ProjectStatus status;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    this.imagePath,
    this.images = const [],
    this.githubUrl,
    this.otherUrl,
    this.liveUrl,
    required this.technologies,
    this.status = ProjectStatus.completed,
  });
}

enum ProjectStatus {
  completed,
  inProgress,
  planned,
}

extension ProjectStatusExtension on ProjectStatus {
  String get displayName {
    switch (this) {
      case ProjectStatus.completed:
        return 'Concluído';
      case ProjectStatus.inProgress:
        return 'Em Desenvolvimento';
      case ProjectStatus.planned:
        return 'Planejado';
    }
  }

  String get displayNameEn {
    switch (this) {
      case ProjectStatus.completed:
        return 'Completed';
      case ProjectStatus.inProgress:
        return 'In Development';
      case ProjectStatus.planned:
        return 'Planned';
    }
  }
}

