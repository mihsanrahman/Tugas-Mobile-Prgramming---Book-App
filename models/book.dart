class BookList {
  String imageUrl;
  String writers;
  String title;

  BookList(
      {required this.imageUrl, required this.writers, required this.title});
}

List<BookList> bookLists = [
  BookList(
    imageUrl: 'assets/images/one-piece.jpg',
    writers: 'Guy Kawasaki',
    title: 'One Piece',
  ),
  BookList(
    imageUrl: 'assets/images/Discovering_Myself.jpg',
    writers: 'Aaron Mahnke',
    title: 'Discovering Myself',
  ),
  BookList(
    imageUrl: 'assets/images/recentbook_1.png',
    writers: 'Spencer Johnson, M.D',
    title: 'Magic',
  ),
  BookList(
    imageUrl: 'assets/images/recentbook_2.png',
    writers: 'Arip Supandi',
    title: 'The Martian',
  ),
];
