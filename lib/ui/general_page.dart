import 'package:flutter/material.dart';
import 'package:my_chat/state/general_page_state.dart';
import 'package:my_chat/ui/chat_list_page.dart';
import 'package:my_chat/ui/home_page.dart';
import 'package:provider/provider.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GeneralPageState(),
      child: _GeneralPageScreen(),
    );
  }
}

class _GeneralPageScreen extends StatelessWidget {
  _GeneralPageScreen({super.key});

  final List<Widget> _pages = [const ChatListPage(), const HomePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GeneralPageState>(
        builder: (_, value, child) {
          return _pages[value.currentIndex];
        },
      ),
      bottomNavigationBar: Consumer<GeneralPageState>(
        builder: (_, value, child) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.green,
                  currentIndex: value.currentIndex,
                  onTap: (index) => {value.setCurrentIndex(index)},
                  unselectedItemColor: Colors.black,
                  selectedItemColor: Colors.transparent,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.chat),
                      label: "Chat",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left:
                    MediaQuery.of(context).size.width * value.currentIndex / 2 +
                        MediaQuery.of(context).size.width / 4 -
                        30,
                child: _buildSelectedItemIcon(value.currentIndex),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSelectedItemIcon(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Center(
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                index == 0 ? Icons.chat : Icons.home,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 2.5,
            ),
            Text(
              index == 0 ? "Chat" : "Home",
              style: const TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
