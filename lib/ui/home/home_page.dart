import 'package:flutter/material.dart';
import 'package:school_web_management/ui/teachers/teachers_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final models = <LeadingViewModel>[
    LeadingViewModel(text: 'Quản lý giáo viên', page: TeachersPage()),
    LeadingViewModel(text: 'Quản lý sinh vien', page: Container()),
  ];

  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
            width: double.infinity,
            color: Colors.blueAccent,
            padding: const EdgeInsets.all(12),
            child: Text(
              'Trang chính',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            )),
        Expanded(
          child: Row(
            children: [
              Expanded(flex: 1, child: _buildListMainHandle()),
              Expanded(
                  flex: 4,
                  child: PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: models.map((e) => e.page).toList())),
            ],
          ),
        )
      ]),
    );
  }

  _buildListMainHandle() {
    return Container(
      color: Colors.blueAccent,
      child: Column(
        children: models
            .map((e) => Padding(
                  padding: const EdgeInsets.only(top: 12, left: 4),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          e.text,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.white)
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class LeadingViewModel {
  final String text;
  final Widget page;

  LeadingViewModel({required this.text, required this.page});
}
