import 'package:bookshelf_app/models/book_model.dart';
import 'package:bookshelf_app/models/single_book_model.dart';

List<BookModel> getBooks() {
  List<BookModel> books = new List<BookModel>();
  BookModel bookModel = new BookModel();

  //1
  bookModel.imgAssetPath = "assets/ccna.jpg";
  bookModel.title = "CCNA 200-301 Official Cert Guide";
  bookModel.description = '''“Cisco Press has the only study guides
   approved by Cisco''';
  bookModel.rating = 5;
  bookModel.categorie = "Wendell Odom";

  books.add(bookModel);
  bookModel = new BookModel();

//1
  bookModel.imgAssetPath = "assets/A+.jpg";
  bookModel.title = "CCNP Enterprise Core ENCOR 350-401";
  bookModel.description =
      '''Cisco Press has the only Study Guides approved by Cisco
   for the New CCNP   ''';
  bookModel.rating = 5;
  bookModel.categorie = " Kevin Wallace";

  books.add(bookModel);
  bookModel = new BookModel();

  //1
  bookModel.imgAssetPath = "assets/linux.jpg";
  bookModel.title = "CCNP Security Identity Management SISE 300-715 ";
  bookModel.description = '''Trust the best-selling Official
      ''';
  bookModel.rating = 5;
  bookModel.categorie = "Katherine";

  books.add(bookModel);
  bookModel = new BookModel();

  //1
  bookModel.imgAssetPath = "assets/security+.jpg";
  bookModel.title = "Cisco CyberOps Associate CBROPS 200-201 ";
  bookModel.description = '''Trust the best-selling Official Cert ''';
  bookModel.rating = 4;
  bookModel.categorie = "Omar Santos";

  books.add(bookModel);
  bookModel = new BookModel();

  return books;

  //1
}

List<SingleBookModel> getSingleBooks() {
  List<SingleBookModel> books = new List<SingleBookModel>();
  SingleBookModel singleBookModel = new SingleBookModel();

  //1
  singleBookModel.imgAssetPath = "assets/ccna.jpg";
  singleBookModel.title = " CCENT/CCNA ICND1 100-105";
  singleBookModel.categorie = "by Odom";
  books.add(singleBookModel);

  singleBookModel = new SingleBookModel();

  //2
  singleBookModel.imgAssetPath = "assets/ccnp.jpg";
  singleBookModel.title = "CCNP and CCIE Security Core SCOR 350-701 ";
  singleBookModel.categorie = "Official Cert Guide";
  books.add(singleBookModel);

  singleBookModel = new SingleBookModel();

  //3
  singleBookModel.imgAssetPath = "assets/Devnet.jpg";
  singleBookModel.title = "DevNet Associate DEVASC";
  singleBookModel.categorie = "by Chris Jackson";
  books.add(singleBookModel);

  singleBookModel = new SingleBookModel();

  //4
  singleBookModel.imgAssetPath = "assets/ccnpsecurity.jpg";
  singleBookModel.title = "CCNP and CCIE Security Core ";
  singleBookModel.categorie = "Official Cert Guide ";
  books.add(singleBookModel);

  singleBookModel = new SingleBookModel();

  //1
  singleBookModel.imgAssetPath = "assets/CCDE.jpg";
  singleBookModel.title = "CCDE Study Guide";
  singleBookModel.categorie = "by Marwan Al-shawi";
  books.add(singleBookModel);

  singleBookModel = new SingleBookModel();

  return books;
}

//Second Single Book Model

List<SingleBookModel> getSingleBooks2() {
  List<SingleBookModel> books2 = new List<SingleBookModel>();
  SingleBookModel singleBookModel2 = new SingleBookModel();

  //1
  singleBookModel2.imgAssetPath = "assets/A+.jpg";
  singleBookModel2.title = "CompTIA A+ Certification ";
  singleBookModel2.categorie = "by Mike Meyers";
  books2.add(singleBookModel2);

  singleBookModel2 = new SingleBookModel();

  //2
  singleBookModel2.imgAssetPath = "assets/linux.jpg";
  singleBookModel2.title = " CompTIA Linux+ XK0-004";
  singleBookModel2.categorie = "by Pearson Education";
  books2.add(singleBookModel2);

  singleBookModel2 = new SingleBookModel();

  //3
  singleBookModel2.imgAssetPath = "assets/pentest+.jpg";
  singleBookModel2.title = "CompTIA PenTest+ ";
  singleBookModel2.categorie = "by Raymond Nutting";
  books2.add(singleBookModel2);

  singleBookModel2 = new SingleBookModel();

  //4
  singleBookModel2.imgAssetPath = "assets/security+.jpg";
  singleBookModel2.title = "CompTIA Security+ ";
  singleBookModel2.categorie = "by Darril Gibson";
  books2.add(singleBookModel2);

  singleBookModel2 = new SingleBookModel();

  //1
  singleBookModel2.imgAssetPath = "assets/server+.jpg";
  singleBookModel2.title = "CompTIA Server+ ";
  singleBookModel2.categorie = "by Daniel Lachance ";
  books2.add(singleBookModel2);

  singleBookModel2 = new SingleBookModel();

  return books2;
}
