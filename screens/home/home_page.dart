import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/screens/home/components/recent_book.dart';
import 'package:e_book_app/screens/home/components/trending_book.dart';
import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const nameRoute = '/homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _isSelected = 0;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile-pic.png'),
                ),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Helle Ihsan,',
                  style: semiBoldText16,
                ),
                Text(
                  'Semoga Harimu Menyenangkan!',
                  style: regularText14.copyWith(color: blackColor),
                ),
              ],
            ),
            Spacer(),
            Image.asset(
              'assets/icons/icon-menu.png',
              width: 18,
            ),
          ],
        ),
      );
    }

    Widget searchField() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Cari Buku',
            hintStyle: mediumText12.copyWith(color: greyColor),
            fillColor: greyColorSearchField,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            isCollapsed: true,
            contentPadding: EdgeInsets.all(18),
            suffixIcon: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Icon(
                  Icons.search_rounded,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget recentBook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            RecentBook(
              image: 'assets/images/Cantik-Itu-Luka.jpg',
              title: 'Cantik Itu Luka',
            ),
            SizedBox(width: 20),
            RecentBook(
              image: 'assets/images/Kita-Pergi-Hari-Ini.jpg',
              title: 'Kita Pergi Hari Ini',
            ),
            SizedBox(width: 20),
            RecentBook(
              image: 'assets/images/Hujan.jpg',
              title: 'Hujan',
            ),
          ],
        ),
      );
    }

    Widget categories(int index) {
      return InkWell(
        onTap: () {
          setState(() {
            _isSelected = index;
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: 30, right: 12),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            color: _isSelected == index ? greenColor : transParentColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      );
    }

    Widget trendingBook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: bookLists
              .asMap()
              .entries
              .map(
                (MapEntry map) => TrendingBook(
                  info: bookLists[map.key],
                ),
              )
              .toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                SizedBox(height: 30),
                searchField(),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Lanjutkan Membaca',
                    style: semiBoldText16.copyWith(color: blackColor),
                  ),
                ),
                SizedBox(height: 12),
                recentBook(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30),
            child: Text(
              'Sedang Trending',
              style: semiBoldText16.copyWith(color: blackColor),
            ),
          ),
          trendingBook(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
