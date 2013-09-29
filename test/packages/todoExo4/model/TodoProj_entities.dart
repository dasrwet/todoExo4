part of todoExo4;

class Project extends ConceptEntity<Project> {

  String _name;
  String description;
  bool etat;

  String get name => _name;
  set name(String name) {
    _name = name;
    if (code == null) {
      code = name;
    }
  }

  Project newEntity() => new Project();

  Project copy() {
    var project = super.copy();
    project.name = name;
    project.description = description;
    project.etat=false;
    return project;
  }

  String toString() {
    return '  {\n '
           '    ${super.toString()}, \n '
           '    name: ${name}, \n '
           '    description: ${description}\n'
           '    statuts: ${etat}\n'
           '  }';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['name'] = name;
    entityMap['description'] = description;
    entityMap['etat'] = etat;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    super.fromJson(entityMap);
    name = entityMap['name'];
    description = entityMap['description'];
    etat = entityMap['etat'];
  }

  bool get onProgramming =>
      description.contains('rediger') ? true : false;

  int compareTo(Project other) {
    return name.compareTo(other.name);
  }

}

class Projects extends ConceptEntities<Project> {

  Projects newEntities() => new Projects();
  Project newEntity() => new Project();

}
