

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tradaru_tes/category/category_list_page.dart';
import 'package:tradaru_tes/components/custom_bottom_bar.dart';
import 'package:tradaru_tes/components/product_list.dart';
import 'package:tradaru_tes/components/tab_view.dart';
import 'package:tradaru_tes/custom_background.dart';
import 'package:tradaru_tes/models/product.dart';
import 'package:flutter/material.dart';
import 'package:tradaru_tes/profile_page.dart';
import 'package:tradaru_tes/shop/check_out_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

List<String> timelines = ['Best Seller', 'Daily Suggestion', 'Best of 2018'];
String selectedTimeline = 'Best Seller';

List<Product> products = [
  Product(
      'assets/headphones_2.png',
      'Skullcandy headset L325',
      'Skullcandy headset L325, sebuah headshead dari Microsoft',
      102.99),
  Product(
      'assets/headphones_3.png',
      'Skullcandy headset X25',
      'Skullcandy headset X25, sebuah headshead dari Microsoft',
      55.99),
  Product(
      'assets/headphones.png',
      'Blackzy PRO hedphones M003',
      'Blackzy PRO headphone M003, sebuah headshead dari Microsoft',
      152.99),
];

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin<MainPage> {
  SwiperController swiperController;
  TabController tabController;
  TabController bottomTabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    bottomTabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar = Container(
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              // onPressed: () => Navigator.of(context)
              // .push(MaterialPageRoute(builder: (_) => NotificationsPage())),
              icon: Icon(Icons.notifications)),
          IconButton(
              // onPressed: () => Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: SvgPicture.asset('assets/icons/search_icon.svg'))
        ],
      ),
    );

    Widget topHeader = Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[0];
                    products = [
                      Product(
                          'assets/headphones_2.png',
                          'Skullcandy headset L325',
                          'Skullcandy headset L325, sebuah headshead dari Microsoft',
                          102.99),
                      Product(
                          'assets/headphones_3.png',
                          'Skullcandy headset X25',
                          'Skullcandy headset X25, sebuah headshead dari Microsoft',
                          55.99),
                      Product(
                          'assets/headphones.png',
                          'Blackzy PRO hedphones M003',
                          'Blackzy PRO headphone M003, sebuah headshead dari Microsoft',
                          152.99),
                    ];
                  });
                },
                child: Text(
                  timelines[0],
                  style: TextStyle(
                      fontSize: timelines[0] == selectedTimeline ? 20 : 14,
                      color: Colors.grey),
                ),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[1];
                    products = [
                      Product(
                          'assets/bag_5.png',
                          'Skullcandy headset L325',
                          'Skullcandy headset L325, sebuah headshead dari Microsoft',
                          102.99),
                      Product(
                          'assets/bag_6.png',
                          'Skullcandy headset X25',
                          'Skullcandy headset X25, sebuah headshead dari Microsoft',
                          55.99),
                      Product(
                          'assets/bag_3.png',
                          'Blackzy PRO hedphones M003',
                          'Blackzy PRO headphone M003, sebuah headshead dari Microsoft',
                          152.99),
                    ];
                  });
                },
                child: Text(timelines[1],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: timelines[1] == selectedTimeline ? 20 : 14,
                        color: Colors.grey)),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[2];
                    products = [
                      Product(
                          'assets/headphone_13.png',
                          'Skullcandy headset L325',
                          'Skullcandy headset L325, sebuah headshead dari Microsoft',
                          102.99),
                      Product(
                          'assets/jeans_4.png',
                          'Skullcandy headset X25',
                          'Skullcandy headset X25, sebuah headshead dari Microsoft',
                          55.99),
                      Product(
                          'assets/ring_7.png',
                          'Blackzy PRO hedphones M003',
                          'Blackzy PRO headphone M003, sebuah headshead dari Microsoft',
                          152.99),
                    ];
                  });
                },
                child: Text(timelines[2],
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: timelines[2] == selectedTimeline ? 20 : 14,
                        color: Colors.grey)),
              ),
            ),
          ],
        ));

    Widget tabBar = TabBar(
      tabs: [
        Tab(text: 'Trending'),
        Tab(text: 'Sports'),
        Tab(text: 'Headsets'),
        Tab(text: 'Wireless'),
        Tab(text: 'Bluetooth'),
      ],
      labelStyle: TextStyle(fontSize: 16.0),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.0,
      ),
      labelColor: Colors.grey,
      unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.5),
      isScrollable: true,
      controller: tabController,
    );

    return Scaffold(
      bottomNavigationBar: CustomBottomBar(controller: bottomTabController),
      body: CustomPaint(
        painter: MainBackground(),
        child: TabBarView(
          controller: bottomTabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            SafeArea(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  // These are the slivers that show up in the "outer" scroll view.
                  return <Widget>[
                    SliverToBoxAdapter(
                      child: appBar,
                    ),
                    SliverToBoxAdapter(
                      child: topHeader,
                    ),
                    SliverToBoxAdapter(
                      child: ProductList(
                        products: products,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: tabBar,
                    )
                  ];
                },
                body: TabView(
                  tabController: tabController,
                ),
              ),
            ),
            CategoryListPage(),
            CheckOutPage(),
            ProfilePage()
          ],
        ),
      ),
    );
  }
}
