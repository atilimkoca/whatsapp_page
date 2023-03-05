import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1, //optional, starts from 0, select the tab by default
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: const Text('WhatsApp'),
              backgroundColor: Color.fromARGB(255, 13, 104, 16),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(vertical: 8.0),
            //     color: Colors.white,
            //     child: Column(
            //       children: <Widget>[
            //         ListTile(
            //           leading: const CircleAvatar(
            //             backgroundImage: NetworkImage(
            //                 'https://www.teknozum.com/wp-content/uploads/2019/12/whatsapp-profil-foto%C4%9Fraflar%C4%B1-49-1024x842.jpg'),
            //             radius: 25.0,
            //           ),
            //           title: const Text('My status'),
            //           subtitle: const Text('Tap to add status update'),
            //           trailing: IconButton(
            //             icon: const Icon(Icons.more_horiz),
            //             onPressed: () {},
            //           ),
            //         ),
            //         const Divider(),
            //         const ListTile(
            //           leading: CircleAvatar(
            //             backgroundImage: NetworkImage(
            //                 'https://www.teknozum.com/wp-content/uploads/2019/12/whatsapp-profil-foto%C4%9Fraflar%C4%B1-49-1024x842.jpg'),
            //             radius: 25.0,
            //           ),
            //           title: Text('Contact name'),
            //           subtitle: Text('Status update'),
            //           trailing: Text('11:00 AM'),
            //         ),
            //         const Divider(),
            //         // Add more status updates here
            //       ],
            //     ),
            //   ),
            // ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                const TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  indicatorColor: Colors.white,
                  tabs: <Widget>[
                    Tab(text: 'Sohbetler'),
                    Tab(text: 'Durum'),
                    Tab(text: 'Aramalar'),
                  ],
                ),
              ),
              pinned: true,
            ),
            SliverFillRemaining(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.teknozum.com/wp-content/uploads/2019/12/whatsapp-profil-foto%C4%9Fraflar%C4%B1-49-1024x842.jpg'),
                      radius: 25.0,
                    ),
                    title: Text('Contact name'),
                    subtitle: Text('Last message'),
                    trailing: Text('12:00 PM'),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.chat),
          backgroundColor: Color.fromARGB(255, 13, 104, 16),
          onPressed: () {},
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color.fromARGB(255, 13, 104, 16),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
