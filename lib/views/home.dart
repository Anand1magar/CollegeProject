import 'package:bookshelf_app/views/book_details.dart';
import 'package:flutter/material.dart';
import 'package:bookshelf_app/data/data.dart';
import 'package:bookshelf_app/models/book_model.dart';
import 'package:bookshelf_app/models/single_book_model.dart';
import 'package:bookshelf_app/resource/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart' as login;
import 'webview.dart' as web;

String slectedCategorie = "All";

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // IT will talk with firebase

  List<String> categories = ["All", "Recommended", "Popular books", "My books"];

  List<BookModel> books = new List<BookModel>();
  List<SingleBookModel> singleeBooks = new List<SingleBookModel>();
  List<SingleBookModel> singleeBooks2 = new List<SingleBookModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    books = getBooks();
    singleeBooks = getSingleBooks();
    singleeBooks2 = getSingleBooks2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Container(
        color: Color(0xffF2F5F9),
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Hi there !",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                    ),
                    Spacer(),
                    // Image.asset(
                    //   "assets/search.png",
                    // ),
                    SizedBox(
                      width: 14,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/userid.jpg"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => web.WebPage(),
                              ));
                        },
                        child: Container(
                          height: 94.0,
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(Icons.play_circle_fill_outlined,
                                    size: 40.0, color: Colors.white),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Video courses",
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.white),
                                ),
                              ],
                            ),
                          )),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xff6DC8F3),
                                  Color(0xff73A1F9),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff73A1F9),
                                blurRadius: 12,
                                offset: Offset(0, 6),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      flex: 1,
                      child: Container(
                        height: 94.0,
                        width: MediaQuery.of(context).size.width * 0.43,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage("assets/careerPath.png"),
                                width: 40.0,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Career Path",
                                style: TextStyle(
                                    fontSize: 17.0, color: Colors.white),
                              ),
                            ],
                          ),
                        )),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xffFABF37),
                                Color(0xffFB7D21),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffFB7D21),
                              blurRadius: 12,
                              offset: Offset(0, 6),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                height: 40,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CategorieTile(
                        text: categories[index],
                        isSelected: slectedCategorie == categories[index],
                      );
                    }),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    itemCount: books.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BooksTile(
                        imgAssetPath: books[index].imgAssetPath,
                        rating: books[index].rating,
                        title: books[index].title,
                        description: books[index].description,
                        categorie: books[index].categorie,
                      );
                    }),
              ),
              SizedBox(
                height: 16,
              ),

              //Single Book Tile
              Text(
                "Cisco Books",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 250,
                child: ListView.builder(
                    itemCount: singleeBooks.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SingleBookTile(
                        title: singleeBooks[index].title,
                        categorie: singleeBooks[index].categorie,
                        imgAssetPath: singleeBooks[index].imgAssetPath,
                      );
                    }),
              ),

              Text(
                "CompTIA Books",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 250,
                child: ListView.builder(
                    itemCount: singleeBooks2.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SingleBookTile(
                        title: singleeBooks2[index].title,
                        categorie: singleeBooks2[index].categorie,
                        imgAssetPath: singleeBooks2[index].imgAssetPath,
                      );
                    }),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    ]));
  }
}

class CategorieTile extends StatefulWidget {
  final String text;
  final bool isSelected;
  CategorieTile({this.text, @required this.isSelected});

  @override
  _CategorieTileState createState() => _CategorieTileState();
}

class _CategorieTileState extends State<CategorieTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 12),
              child: Text(
                widget.text,
                style: TextStyle(
                    color: widget.isSelected ? Colors.black87 : Colors.grey,
                    fontWeight:
                        widget.isSelected ? FontWeight.w600 : FontWeight.w400,
                    fontSize: widget.isSelected ? 23 : 18),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            widget.isSelected
                ? Container(
                    height: 5,
                    width: 16,
                    decoration: BoxDecoration(
                        color: Color(0xff007084),
                        borderRadius: BorderRadius.circular(12)),
                  )
                : Container()
          ],
        ));
  }
}

class BooksTile extends StatelessWidget {
  final String imgAssetPath, title, description, categorie;
  final int rating;
  BooksTile(
      {@required this.rating,
      @required this.description,
      @required this.title,
      @required this.categorie,
      @required this.imgAssetPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BookDetails()));
      },
      child: Container(
        height: 200,
        margin: EdgeInsets.only(right: 16),
        alignment: Alignment.bottomLeft,
        child: Stack(
          children: <Widget>[
            Container(
              height: 180,
              alignment: Alignment.bottomLeft,
              child: Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 140,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 110,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              title,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              description,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            Spacer(),
                            Row(
                              children: <Widget>[
                                StarRating(
                                  rating: rating,
                                ),
                                Spacer(),
                                Text(
                                  categorie,
                                  style: TextStyle(color: Color(0xff007084)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              height: 180,
              margin: EdgeInsets.only(
                left: 12,
                top: 6,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imgAssetPath,
                  height: 150,
                  width: 110,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SingleBookTile extends StatelessWidget {
  final String title, categorie, imgAssetPath;
  SingleBookTile({this.title, this.categorie, this.imgAssetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      padding: EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imgAssetPath,
              height: 170,
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
          Text(
            categorie,
            style: TextStyle(color: Color(0xff007084), fontSize: 13),
          )
        ],
      ),
    );
  }
}
