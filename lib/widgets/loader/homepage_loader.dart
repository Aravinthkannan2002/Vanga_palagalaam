import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vanga_palagalam/constants.dart';

class HomepageLoader extends StatelessWidget {
  const HomepageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor:defaultBackgroundColor,
        title: const Text(''),
        centerTitle: false,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.favorite,
                size: 64,
              ),
            ),
            _buildShimmerTile(Icons.home, 'D A S H B O A R D'),
            _buildShimmerTile(Icons.settings, 'S E T T I N G S'),
            _buildShimmerTile(Icons.info, 'A B O U T'),
            _buildShimmerTile(Icons.logout, 'L O G O U T'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // first 4 boxes in grid
            AspectRatio(
              aspectRatio: 1,
              child: SizedBox(
                width: double.infinity,
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return _buildShimmerBox();
                  },
                ),
              ),
            ),
            // list of previous days
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _buildShimmerTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Skeleton loader for the grid box
  Widget _buildShimmerBox() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Skeleton loader for the list tile
  Widget _buildShimmerTile(
      [IconData icon = Icons.home, String text = 'Loading...']) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            color: Colors.grey[300],
          ),
          title: Container(
            width: 150,
            height: 20,
            color: Colors.grey[300],
          ),
          subtitle: Container(
            width: 100,
            height: 15,
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
