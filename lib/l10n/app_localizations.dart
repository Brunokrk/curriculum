import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Bruno Pires - Portfolio'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @graduation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get graduation;

  /// No description provided for @experiences.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experiences;

  /// No description provided for @aboutContent.
  ///
  /// In en, this message translates to:
  /// **'My name is Bruno Marchi Pires, I\'m 24 years old and currently live in Florianópolis. I have a degree in Computer Science from the State University of Santa Catarina (UDESC). Here, in my portfolio, you will be able to better understand my academic and professional trajectory, learn about the projects I have worked on, as well as my ambitions and future goals. I\'m always open to communication and you can contact me through any of the channels available here!'**
  String get aboutContent;

  /// No description provided for @graduationContent.
  ///
  /// In en, this message translates to:
  /// **'I have always had a great affinity with computers and ease with logical reasoning, which led me to enroll in the Computer Science bachelor\'s degree in 2018. Even without prior programming experience, the academic environment proved to be highly stimulating and challenging, providing broad and in-depth learning in various areas. During my academic journey, I acquired a solid foundation in programming with the C language and evolved to object orientation with Java. From there, I explored various areas, including data analysis, evolutionary algorithms, artificial intelligence and game development with Python. I also had contact with functional languages like Haskell, in addition to exploring Web development frameworks like Angular and React. I used some relational and non-relational databases, such as MySQL, PostgreSQL and MongoDB, beyond all the scope that is inherent to a good computer science course. Currently, I dedicate myself to developing mobile solutions with Dart and Flutter. I have always sought to maintain a broad and versatile view in the technology area, testing new frameworks and languages, believing that this facilitates continuous learning of new technologies and avoids exclusive dependence on a single language or framework in building effective solutions.'**
  String get graduationContent;

  /// No description provided for @bmptecPosition.
  ///
  /// In en, this message translates to:
  /// **'Junior Mobile Software Developer'**
  String get bmptecPosition;

  /// No description provided for @bmptecContent.
  ///
  /// In en, this message translates to:
  /// **'I worked on the development of two white label applications marketed to hundreds of clients, participating in the entire development and maintenance cycle.\n\nMain activities:\n• Development with clean architecture, structured in layers (Data, Domain, Presentation).\n• Identification and correction of bugs in development and production environments.\n• Active participation in agile methodologies: refinements, code reviews, dailies and retrospectives.\n• Management of multiple applications in Google Play and App Store stores (white label model).\n• Contribution to technical discussions and decision-making about architecture and development patterns.\n\nTechnical responsibilities:\n• Use of different state managers, such as GetX and Provider.\n• Implementation of clean architecture (contracts, use cases, services, repositories, DTOs and models).\n• Creation and configuration of applications in Firebase.\n• Integration with native operating system resources (e.g.: camera).\n• Firebase Push Notifications configuration.\n• Writing unit tests.\n• Use of pipelines for partner publication in stores and maintenance of the same.\n• Creation of scripts for automation of manual team processes.'**
  String get bmptecContent;

  /// No description provided for @totvsPosition.
  ///
  /// In en, this message translates to:
  /// **'FullStack Development Intern'**
  String get totvsPosition;

  /// No description provided for @totvsContent.
  ///
  /// In en, this message translates to:
  /// **'In the context of a team focused on the international market, I played a significant role in customizing and creating software to meet the specific needs of corporate clients for the international market. As the team\'s main developer in the context of Web technologies, I worked on a large-scale project focused on technological modernization, which consisted of transforming traditional desktop programs into sophisticated web applications adapted for the international market.\n\nDuring this period, I substantially improved my skills in using Angular and AngularJS frameworks, applying programming languages such as TypeScript and HTML to develop robust and efficient solutions.\n\nMy experience also included API development using the Progress4GL language, which facilitated the integration of databases into the new web environment efficiently. Additionally, I had the opportunity to explore PO-UI, a proprietary graphical interface framework from the company, which is also made available for public use.\n\nThis set of skills and experiences not only enriched my technical repertoire, but also enabled a significant contribution to innovation in a large organization, highlighting the relevance and impact of my work.'**
  String get totvsContent;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @portuguese.
  ///
  /// In en, this message translates to:
  /// **'Português'**
  String get portuguese;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'Read more'**
  String get readMore;

  /// No description provided for @readLess.
  ///
  /// In en, this message translates to:
  /// **'Read less'**
  String get readLess;

  /// No description provided for @headerGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hi there, I\'m'**
  String get headerGreeting;

  /// No description provided for @headerName.
  ///
  /// In en, this message translates to:
  /// **'BRUNO MARCHI PIRES'**
  String get headerName;

  /// No description provided for @headerTitle.
  ///
  /// In en, this message translates to:
  /// **'Mobile Software Developer'**
  String get headerTitle;

  /// No description provided for @developedBy.
  ///
  /// In en, this message translates to:
  /// **'Developed by Bruno Marchi Pires'**
  String get developedBy;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get email;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'(48) 99903-1154'**
  String get phoneNumber;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'piresbrcomercial@gmail.com'**
  String get emailAddress;

  /// No description provided for @downloadCV.
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get downloadCV;

  /// No description provided for @downloadCVPortuguese.
  ///
  /// In en, this message translates to:
  /// **'CV in Portuguese'**
  String get downloadCVPortuguese;

  /// No description provided for @downloadCVEnglish.
  ///
  /// In en, this message translates to:
  /// **'CV in English'**
  String get downloadCVEnglish;

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @github.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get github;

  /// No description provided for @linkedin.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get linkedin;

  /// No description provided for @instagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get instagram;

  /// No description provided for @information.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @totvsPeriod.
  ///
  /// In en, this message translates to:
  /// **'Nov 2021 - Jul 2023'**
  String get totvsPeriod;

  /// No description provided for @bmptecPeriod.
  ///
  /// In en, this message translates to:
  /// **'Jul 2024 - Oct 2025'**
  String get bmptecPeriod;

  /// No description provided for @accenturePosition.
  ///
  /// In en, this message translates to:
  /// **'Product Engineering Analyst Pleno'**
  String get accenturePosition;

  /// No description provided for @accentureContent.
  ///
  /// In en, this message translates to:
  /// **'Working with Flutter, I actively participated in several teams, the main one being the support team, working on the maintenance and development of functionalities for the VIVOMAIS application, a telephone company app used by salespeople in the operator\'s physical stores. I also worked with the architecture team, using my experience in modularized contexts to propose solutions for new developments within the application.'**
  String get accentureContent;

  /// No description provided for @accenturePeriod.
  ///
  /// In en, this message translates to:
  /// **'Oct 2025 - Current'**
  String get accenturePeriod;

  /// No description provided for @technologies.
  ///
  /// In en, this message translates to:
  /// **'Technologies:'**
  String get technologies;

  /// No description provided for @viewProject.
  ///
  /// In en, this message translates to:
  /// **'View Project'**
  String get viewProject;

  /// No description provided for @listinTitle.
  ///
  /// In en, this message translates to:
  /// **'Listin - Shopping List App'**
  String get listinTitle;

  /// No description provided for @listinDescription.
  ///
  /// In en, this message translates to:
  /// **'Mobile application developed in Flutter for shopping list management. Includes features such as adding products, sorting, product modification and intuitive interface. The main objective of the project was to study and learn some Firebase features, as well as its integration with Flutter apps.'**
  String get listinDescription;

  /// No description provided for @eventsTitle.
  ///
  /// In en, this message translates to:
  /// **'UDESC EVENTS - Event Management app'**
  String get eventsTitle;

  /// No description provided for @eventsDescription.
  ///
  /// In en, this message translates to:
  /// **'Mobile application developed in Flutter for managing UDESC events, developed during the \'Human-Computer Interaction\' course, applying good UX/UI practices, together with concepts of using Google Firebase.'**
  String get eventsDescription;

  /// No description provided for @recipesTitle.
  ///
  /// In en, this message translates to:
  /// **'My Recipes - Personal Recipes Management'**
  String get recipesTitle;

  /// No description provided for @recipesDescription.
  ///
  /// In en, this message translates to:
  /// **'Mobile application developed in Flutter for managing personal recipes, applying good UX/UI practices, using a local API made with node-js, with the objective of studying communication with WebAPIs, use of images and some architectural concepts.'**
  String get recipesDescription;

  /// No description provided for @tccTitle.
  ///
  /// In en, this message translates to:
  /// **'Requirements identification via the Lean Startup cycle to connect People with Disabilities to Services'**
  String get tccTitle;

  /// No description provided for @tccDescription.
  ///
  /// In en, this message translates to:
  /// **'This final project for the Bachelor\'s degree in Computer Science identified the requirements for a potential app to connect people with disabilities to services. The work was presented and published in the proceedings of the 2025 Brazilian Symposium on Collaborative Systems.'**
  String get tccDescription;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
