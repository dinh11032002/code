import 'package:flutter/material.dart';
import 'model/notification.dart';

void main() => runApp(const MaterialApp(
      home: WidgetTest(),
    ));

class WidgetTest extends StatefulWidget {
  const WidgetTest({Key? key}) : super(key: key);

  @override
  State<WidgetTest> createState() => _WidgetState();
}

class _WidgetState extends State<WidgetTest> {
  int _currentIndex = 0;

  bool isAllSelected = true;

  List<NotificationItem> allNotifications = [
    NotificationItem(
      title: "TỜ ĐIỀU TRỊ",
      description:
          "Tờ điều trị của Trần Thị Anh Thư - Khoa Nội tim mạch cần duyệt.",
      date: "17:30 Ngày 02/07/2024",
    ),
    NotificationItem(
      title: "PHIẾU ĐÁNH GIÁ",
      description:
          "Phiếu đánh giá tình trạng dinh dưỡng của Trần Thị Anh Thư - Khoa Nội tim mạch cần duyệt.",
      date: "18:30 Ngày 02/07/2024",
    ),
    NotificationItem(
      title: "PHIẾU THEO DÕI",
      description:
          "Phiếu theo dõi truyền dịch của Trần Thị Anh Thư - Khoa Nội tim mạch cần duyệt.",
      date: "21:30 Ngày 01/07/2024",
    ),
    NotificationItem(
      title: "GIẤY BÁO MỔ",
      description:
          "Tờ điều trị của Trần Thị Anh Thư - Khoa Nội tim mạch cần duyệt.",
      date: "17:30 Ngày 02/07/2024",
    ),
  ];

  List<NotificationItem> unreadNotifications = [
    NotificationItem(
      title: "TỜ ĐIỀU TRỊ",
      description:
          "Tờ điều trị của Trần Thị Anh Thư - Khoa Nội tim mạch cần duyệt.",
      date: "17:30 Ngày 02/07/2024",
    ),
    NotificationItem(
      title: "PHIẾU ĐÁNH GIÁ",
      description:
          "Phiếu đánh giá tình trạng dinh dưỡng của Trần Thị Anh Thư - Khoa Nội tim mạch cần duyệt.",
      date: "18:30 Ngày 02/07/2024",
    ),
  ];

  List<Widget> body = const [
    Text(""),
    Text(""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _currentIndex == 2
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    "THÔNG BÁO",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 90, 163)),
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey.withOpacity(0.5),
                    margin: const EdgeInsets.symmetric(vertical: 0),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isAllSelected = true;
                            });
                          },
                          child: Column(
                            children: [
                              const Text(
                                "Tất cả",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 90, 163),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                height: 2,
                                width: double.infinity,
                                color: isAllSelected
                                    ? const Color.fromARGB(255, 0, 90, 163)
                                    : Colors.transparent,
                              ),
                              Container(
                                height: 1,
                                color: Colors.grey.withOpacity(0.5),
                                margin: const EdgeInsets.symmetric(vertical: 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isAllSelected = false;
                            });
                          },
                          child: Column(
                            children: [
                              const Text(
                                "Chưa đọc",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 90, 163),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                height: 2,
                                width: double.infinity,
                                color: !isAllSelected
                                    ? const Color.fromARGB(255, 0, 90, 163)
                                    : Colors.transparent,
                              ),
                              Container(
                                height: 1,
                                color: Colors.grey.withOpacity(0.5),
                                margin: const EdgeInsets.symmetric(vertical: 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Use ListView for content
                  Expanded(
                      child: isAllSelected
                          ? ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              itemCount: allNotifications.length,
                              itemBuilder: (context, index) {
                                final notification = allNotifications[index];
                                return buildNotificationCard(
                                    notification.title,
                                    notification.description,
                                    notification.date);
                              },
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              itemCount: unreadNotifications.length,
                              itemBuilder: (context, index) {
                                final notification = unreadNotifications[index];
                                return buildNotificationCard(
                                    notification.title,
                                    notification.description,
                                    notification.date);
                              },
                            )),
                ],
              )
            : body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        selectedItemColor: const Color.fromARGB(255, 0, 90, 163),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(label: 'Trang chủ', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Tài khoản', icon: Icon(Icons.person)),
          BottomNavigationBarItem(
              label: 'Thông báo', icon: Icon(Icons.notifications)),
        ],
      ),
    );
  }
}

// Function to build each notification card
Widget buildNotificationCard(String title, String description, String date) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 90, 163)),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
        Row(
          children: [
            const Spacer(), // Add this to push date to the right
            Text(
              date,
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
        Container(
          height: 1,
          color: Colors.grey.withOpacity(0.5),
          margin: const EdgeInsets.symmetric(vertical: 2),
        ),
      ],
    ),
  );
}
