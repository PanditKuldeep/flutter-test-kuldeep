class QuoteDetailsEntity {
  final String? id;
  final String? content;
  final String? author;
  final List<String>? tags;
  final String? authorSlug;
  final String? dateAdded;
  final String? dateModified;

  QuoteDetailsEntity(
      {this.id,
      this.content = "",
      this.author = '',
      this.tags,
      this.authorSlug = '',
      this.dateAdded = '',
      this.dateModified = ''});
}
