part of todoExo4;

class ProjectModel extends ConceptModel {

  static final String project = 'Project';

  Map<String, ConceptEntities> newEntries() {
    var projects = new Projects();
    var map = new Map<String, ConceptEntities>();
    map[project] = projects;
    return map;
  }

  Projects get projects => getEntry(project);

  init() {
    var cv = new Project();
    cv.name = 'redaction CV';
    cv.description =
        'rediger le cv avant la recherche d entrprise.';
    cv.etat = true;
    projects.add(cv);

    var recherche = new Project();
    recherche.name = 'les entreprises';
    recherche.description =
        'recherche des entreprises dans lesquelles postulé.';
    recherche.etat = false;
    projects.add(recherche);

    var motiv = new Project();
    motiv.name = 'redaction motiv';
    motiv.description =
        'rediger le cv avant la recherche d entrprise.';
    motiv.etat = false;
    projects.add(motiv);
    
    var cv1 = new Project();
    cv1.name = 'redaction CV';
    cv1.description =
        'rediger le cv avant la recherche d entrprise.';
    cv1.etat = false;
    projects.add(cv1);
  }

  display() {
    print('Project Model');
    print('=============');
    projects.display('Projects');
    print(
      '============= ============= ============= '
      '============= ============= ============= '
    );
  }
}


