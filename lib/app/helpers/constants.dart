import 'package:portfolio_webapp/app/models/project.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Constants {

  String aboutSec = "Me chamo Bruno Marchi Pires, tenho 24 anos e atualmente resido na cidade de Florianópolis. Sou formado em Ciência da Computação na Universidade do Estado de Santa Catarina (UDESC). "
  "Aqui, no meu portfólio, você poderá entender melhor minha trajetória acadêmica e profissional, conhecer os projetos nos quais já trabalhei, bem como minhas ambições e objetivos futuros. Estou sempre aberto à comunicação e você pode entrar em contato comigo através de qualquer um dos canais disponíveis aqui!";

  String graduationSec = "Sempre tive grande afinidade com computadores e facilidade com raciocínio lógico, o que me levou a ingressar no curso de bacharelado em Ciência da Computação em 2018. Mesmo sem experiência prévia em programação, o ambiente acadêmico mostrou-se altamente estimulante e desafiador, proporcionando um aprendizado amplo e aprofundado em diversas áreas. Durante minha trajetória acadêmica, adquiri uma base sólida em programação com a linguagem C e evoluí para orientação a objetos com Java. A partir daí, explorei diversas áreas, incluindo análise de dados, algoritmos evolutivos, inteligência artificial e desenvolvimento de jogos com Python. Também tive contato com linguagens funcionais como Haskell, além de explorar frameworks para desenvolvimento Web como Angular e React.  Utilizei alguns bancos de dados relacionais e não-relacionais, como MySQL, PostgreSQL e MongoDB, fora todo escopo que é inerente a um bom curso de computação. Atualmente, dedico-me ao desenvolvimento de soluções mobile com Dart e Flutter. Sempre busquei manter uma visão ampla e versátil na área de tecnologia, testando novos frameworks e linguagens, acreditando que isso facilita o aprendizado contínuo de novas tecnologias e evita a dependência exclusiva de uma única linguagem ou framework na construção de soluções eficazes.";

 final List<Map<String, String>> experiences = [
    {
      'company': 'BMPTec',
      'position': 'Desenvolvedor de Software Mobile Júnior',
      'content': 'Atuei no desenvolvimento de dois aplicativos white label comercializados para centenas de clientes, participando de todo o ciclo de desenvolvimento e manutenção.\n\nPrincipais atividades:\n• Desenvolvimento com arquitetura limpa, estruturada em camadas (Data, Domain, Presentation).\n• Identificação e correção de bugs em ambientes de desenvolvimento e produção.\n• Participação ativa em metodologias ágeis: refinamentos, code reviews, dailys e retrospectivas.\n• Gestão de múltiplos aplicativos nas lojas Google Play e App Store (modelo white label).\n• Contribuição em discussões técnicas e tomadas de decisão sobre arquitetura e padrões de desenvolvimento.\n\nResponsabilidades técnicas:\n• Uso de diferentes gerenciadores de estado, como GetX e Provider.\n• Implementação de arquitetura limpa (contratos, use cases, services, repositories, DTOs e models).\n• Criação e configuração de aplicativos no Firebase.\n• Integração com recursos nativos do sistema operacional (ex.: câmera).\n• Configuração de Push Notifications com Firebase.\n• Escrita de testes unitários.\n• Uso de pipelines para publicação de parceiros nas lojas e manutenção das mesmas.\n• Criação de scripts para automatização de processos manuais do time.',
      'assetPath': 'assets/images/bmptec.png',
    },
    {
      'company': 'TOTVS S.A',
      'position': 'Estagiário em Desenvolvimento FullStack',
      'content': 'No contexto de uma equipe focada no mercado internacional, desempenhei um papel significativo na customização e criação de softwares para atender às necessidades específicas de clientes corporativos para o mercado internacional. Como o principal desenvolvedor da equipe no contexto de tecnologias Web, atuei em um projeto de grande envergadura voltado para a modernização tecnológica, que consistiu na transformação de programas desktop tradicionais em aplicações web sofisticadas e adaptadas para o mercado internacional.\n\nDurante esse período, aprimorei substancialmente minhas habilidades no uso dos frameworks Angular e AngularJS, aplicando linguagens de programação como TypeScript e HTML para desenvolver soluções robustas e eficientes.\n\nMinha experiência também incluiu o desenvolvimento de APIs utilizando a linguagem Progress4GL, o que facilitou a integração de bancos de dados ao novo ambiente web de forma eficiente. Adicionalmente, tive a oportunidade de explorar o PO-UI, um framework de interface gráfica proprietário da empresa, que também é disponibilizado para o uso público.\n\nEste conjunto de habilidades e experiências não só enriqueceu meu repertório técnico, mas também possibilitou uma contribuição significativa para a inovação em uma organização de grande porte, destacando a relevância e o impacto do meu trabalho.',
      'assetPath': 'assets/images/totvs.png',
    },
  ];

  // Dados dos projetos - usando as traduções originais
  static List<Project> getProjects(AppLocalizations l10n) {
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
      Project(
        id: '2',
        title: l10n.eventsTitle,
        description: l10n.eventsDescription,
        images: const [
          'assets/udesc_events/login.PNG',
          'assets/udesc_events/feed.PNG',
          'assets/udesc_events/menu_hamb.PNG',
          'assets/udesc_events/evento1.PNG',
          'assets/udesc_events/evento2.PNG',
          'assets/udesc_events/evento3.PNG',
          'assets/udesc_events/Notificacoes.PNG',
          'assets/udesc_events/configuracao_notificacao.PNG',
          'assets/udesc_events/preferencias.PNG',
        ],
        technologies: const ['Flutter', 'Dart', 'Firebase', 'Figma'],
        status: ProjectStatus.completed,
        githubUrl: 'https://github.com/Brunokrk/udesc_events',
      ),
      Project(
        id: '3',
        title: l10n.recipesTitle,
        description: l10n.recipesDescription,
        images: const [
          'assets/recipes/login.jpeg',
          'assets/recipes/categories.jpeg',
          'assets/recipes/recipes.jpeg',
          'assets/recipes/recipe.jpeg',
        ],
        technologies: const ['Flutter', 'Dart', 'REST API', 'Figma'],
        status: ProjectStatus.completed,
        githubUrl: 'https://github.com/Brunokrk/My-Recipes',
      ),
    ];
  }

  // Lista de todas as tecnologias disponíveis para filtro
  static List<String> getAllTechnologies(AppLocalizations l10n) {
    final projects = getProjects(l10n);
    final Set<String> technologies = {};
    
    for (final project in projects) {
      technologies.addAll(project.technologies);
    }
    
    return technologies.toList()..sort();
  }

}

