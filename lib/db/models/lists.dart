final String tablenamelists = "lists";

class ListsTableField {
  static final List<String> values = [id, name];

  static final String id = "id";
  static final String name = "name";
}

class Lists {
  late final int? id;
  late final String? name;

  Lists({this.id, this.name});

  Lists Copy({int? id, String? name}) {
    return Lists(id: id ?? this.id, name: name ?? this.name);
  }

  Map<String, Object?> toJson() => {
        ListsTableField.id: id,
        ListsTableField.name: name,
      };

  static Lists fromJson(Map<String, Object?> json) => Lists(
        id: json[ListsTableField.id] as int?,
        name: json[ListsTableField.name] as String?,
      );
}
