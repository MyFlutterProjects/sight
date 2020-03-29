class Devotion {
  final String id;
  final String title;
  final String body;
  final String dateCreated;

 
  Devotion(this.id, this.title, this.body, this.dateCreated);

  

  factory Devotion.fromJson(Map<String, dynamic> json) {
    return Devotion(  
      json['id'],
      json['title'],
      json['body'],
      json['dateCreated']
    );
  }


}