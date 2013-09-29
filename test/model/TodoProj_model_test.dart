import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:todoExo4/todoExo4.dart';

testProjects(Projects projects) {
  group("Testing Projects", () {
    setUp(() {
      var projectCount = 0;
      expect(projects.length, equals(projectCount));

      var cv = new Project();
      expect(cv, isNotNull);
      cv.name = 'redaction CV';
      cv.description =
          'rediger le cv avant la recherche d entrprise.';
      cv.etat = true;
      projects.add(cv);
      expect(projects.length, equals(++projectCount));

      
      var recherche = new Project();
      expect(recherche, isNotNull);
      recherche.name = 'les entreprises';
      recherche.description =
          'recherche des entreprises dans lesquelles postulé.';
      recherche.etat = false;
      projects.add(recherche);
      expect(projects.length, equals(++projectCount));

      var motiv = new Project();
      expect(motiv, isNotNull);
      motiv.name = 'redaction motiv';
      motiv.description =
          'rediger le cv avant la recherche d entrprise.';
      motiv.etat = false;
      projects.add(motiv);
      expect(projects.length, equals(++projectCount));

      var cv1 = new Project();
      expect(motiv, isNotNull);
      cv1.name = 'redaction CV1';
      cv1.description =
          'rediger le cv avant la recherche d entrprise.';
      cv1.etat = false;
      projects.add(cv1);
      expect(projects.length, equals(++projectCount));
     // projects.display('Projects');
    });
    tearDown(() {
      projects.clear();
      expect(projects.isEmpty, isTrue);
    });
    test('Add Project', () {
      var project = new Project();
      expect(project, isNotNull);
      project.name = 'entretien';
      project.description = 'appel pour un entretien';
      project.etat = false;
      var added = projects.add(project);
      expect(added, isTrue);
      projects.display('Add Project');
    });
    test('Add Project Without Data', () {
      var projectCount = projects.length;
      var project = new Project();
      expect(project, isNotNull);
      var added = projects.add(project);
      expect(added, isTrue);
      projects.display('Add Project Without Data');
    });
    test('Add Project Not Unique', () {
      var projectCount = projects.length;
      var project = new Project();
      expect(project, isNotNull);
      project.name = 'redaction CV1';
      project.etat = false;
      var added = projects.add(project);
      expect(added, isFalse);
      projects.display('Add Project Not Unique');
    });
    test('Find Project by Name', () {
      var searchName = 'les entreprises';
      var project = projects.find(searchName);
      expect(project, isNotNull);
      expect(project.name, equals(searchName));
      project.display('Find Project by Name');
    });
    test('Select Projects by Function', () {
      var programmingProjects = projects.select((p) => p.onProgramming);
      expect(programmingProjects.isEmpty, isFalse);
      expect(programmingProjects.length, equals(2));
      programmingProjects.display('Select Projects by Function');
    });
    test('Select Projects by Function then Add', () {
      var programmingProjects = projects.select((p) => p.onProgramming);
      expect(programmingProjects.isEmpty, isFalse);

      var dartlingTesting = 'acceptation';
      var programmingProject = new Project();
      programmingProject.name = dartlingTesting;
      programmingProject.description = 'refus ou acceptation a l entretien.';
      programmingProject.etat = true;
      var added = programmingProjects.add(programmingProject);
      expect(added, isTrue);
      programmingProjects.display('Select Projects by Function then Add');

      var project = projects.find(dartlingTesting);
      expect(project, isNull);
      projects.display('Projects');
    });
    test('Select Projects by Function then Remove', () {
      var projectCount = projects.length;
      projects.display('Projects Before Remove');
      var programmingProjects = projects.select((p) => p.onProgramming);
      expect(programmingProjects.isEmpty, isFalse);

      var searchName = 'les entreprises';
      var project = programmingProjects.find(searchName);
      expect(project, isNotNull);
      expect(project.name, equals(searchName));
      var programmingProjectCount = programmingProjects.length;
      programmingProjects.remove(project);
      expect(programmingProjects.length, equals(--programmingProjectCount));
      expect(projects.length, equals(projectCount));
    });
    test('Order Projects by Name', () {
      projects.orderByFunction((m,n) => m.compareTo(n));
      projects.display('Order Projects by Name');
    });
    test('New Project', () {
      var projectCount = projects.length;
      var marketing = new Project();
      expect(marketing, isNotNull);
      marketing.name = 'Dartlng Marketing';
      marketing.description = 'Making Dartling known to the Dart community.';
      marketing.etat=true;
      var added = projects.add(marketing);
      expect(added, isTrue);
      expect(projects.length, equals(++projectCount));
      projects.display('New Project');
    });
    test('Copy Projects', () {
      Projects copiedProjects = projects.copy();
      expect(copiedProjects.isEmpty, isFalse);
      expect(copiedProjects.length, equals(projects.length));
      expect(copiedProjects, isNot(same(projects)));
      expect(copiedProjects, isNot(equals(projects)));
      copiedProjects.forEach((cp) =>
          expect(cp, isNot(same(projects.find(cp.name)))));
      copiedProjects.display('Copied Projects');
      //projects.display('Projects');
    });
    test('True for Every Project', () {
      expect(projects.every((p) => p.code != null), isTrue);
      expect(projects.every((p) => p.name != null), isTrue);
    });
    test('From Projects to JSON', () {
      var json = projects.toJson();
      expect(json, isNotNull);
      print(json);
    });
    test('From JSON to Project Model', () {
      List<Map<String, Object>> json = projects.toJson();
      projects.clear();
      expect(projects.isEmpty, isTrue);
      projects.fromJson(json);
      expect(projects.isEmpty, isFalse);
      projects.display('From JSON to Projects');
    });
  });
}

initDisplayModel() {
  ProjectModel projectModel = new ProjectModel();
  projectModel.init();
  projectModel.display();
  
}

testModel() {
  ProjectModel projectModel = new ProjectModel();
  Projects projects = projectModel.projects;
  testProjects(projects);
}

main() {
  //initDisplayModel();
  testModel();
}
