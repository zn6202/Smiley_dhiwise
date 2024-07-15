// 構建選項網格小部件。
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import '../../core/app_export.dart';
import '../../widgets/bottom_navigation.dart';
import '../../main.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 主題色彩常數，用於應用程式中的主色調。
const Color primaryColor = Color(0xFFA7BA89);
const Color backgroundColor = Color(0xFFF4F4E6);

// 日記主畫面的 StatefulWidget。
class settingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

// SettingScreen 的狀態管理類別，管理小部件的狀態。
class _SettingScreenState extends State<settingScreen> {
  int _currentIndex = 4;
  String userName = '';
  String userProfilePic = '';
  String userId = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  /* 後端這裡要修改!!!!!!!!!!
  這裡是模擬從後端獲取用戶數據的函數 要改成可以從後台抓name 跟照片回來
  */
  Future<void> _fetchUserData() async {
    // 模擬從資料庫獲取數據
    final id = await getUserId(); // 獲取用戶ID
    setState(() {
      userName = '測試用戶';
      userProfilePic = ''; // 不確定使用者照片是存在哪 先用字串
      userId = id ?? '22'; // 如果未獲取到用戶ID，使用默認ID 22
    });
  }

  @override
  // 構建主要小部件結構。
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold 提供一個架構以布局主要組件。
      body: Container(
        color: backgroundColor, // 修改背景顏色。
        child: SafeArea(
          // SafeArea 確保內容顯示在顯示器安全區域邊界內。
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildProfileSection(),
              Expanded(
                child: _buildOptionsGrid(), // 構建並顯示選項網格的小部件。
              ),
              CustomBottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 構建個人資料部分小部件。
  Widget _buildProfileSection() {
    return Container(
      color: backgroundColor, // 修改背景顏色。
      padding: const EdgeInsets.only(
        top: 120.0,
        bottom: 40.0,
      ),
      child: Column(
        children: [
          SizedBox(height: 28.0), // 增加一個固定高度的空間
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white, // 背景顏色
              shape: BoxShape.circle, // 圓形
            ),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Color(0xFFF4F4E6), // 設置背景為白色
              backgroundImage: userProfilePic.isNotEmpty
                  ? NetworkImage(userProfilePic) // 這裡事先預設從伺服器(網路)抓
                  : AssetImage('assets/images/default_avatar.png')
                      as ImageProvider<Object>?,
            ),
          ),
          SizedBox(height: 16.0), // 減小這裡的高度
          Container(
            width: 104,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.white, // 背景顏色
              borderRadius: BorderRadius.circular(20.0), // 圓角
              border: Border.all(color: Color(0xFFFFFFFF), width: 1), // 邊框
            ),
            padding: EdgeInsets.all(2), // 內邊距
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor, // 背景顏色
                borderRadius: BorderRadius.circular(20.0), // 圓角
              ),
              child: Center(
                child: Text(
                  'name',
                  style: TextStyle(
                    fontSize: 14.0, // 字體大小
                    color: Colors.white, // 字體顏色
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0), // 增加一個固定高度的空間
          Text(
            userName, // 用戶名
            style: TextStyle(
              fontSize: 18.0, // 字體大小
              fontWeight: FontWeight.w700,
              color: Color(0xFF545453), // 字體顏色
            ),
          ),
          SizedBox(height: 16.0), // 減小這裡的高度
          Container(
            width: 104,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.white, // 背景顏色
              borderRadius: BorderRadius.circular(20.0), // 圓角
              border: Border.all(color: Color(0xFFFFFFFF), width: 1), // 邊框
            ),
            padding: EdgeInsets.all(2), // 內邊距
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor, // 背景顏色
                borderRadius: BorderRadius.circular(20.0), // 圓角
              ),
              child: Center(
                child: Text(
                  'id',
                  style: TextStyle(
                    fontSize: 14.0, // 字體大小
                    color: Colors.white, // 字體顏色
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0), // 增加一個固定高度的空間
          Text(
            userId, // 用戶 ID
            style: TextStyle(
              fontSize: 18.0, // 字體大小
              fontWeight: FontWeight.w700,
              color: Color(0xFF545453), // 字體顏色
            ),
          ),
        ],
      ),
    );
  }

  // 構建選項網格小部件。
  Widget _buildOptionsGrid() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 60.0,
        right: 60.0,
      ), // 外邊距
      child: GridView.builder(
        itemCount: 4, // 總共4個網格項目
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 每行顯示兩個網格
          crossAxisSpacing: 20.0, // 水平間距
          mainAxisSpacing: 20.0, // 垂直間距
          childAspectRatio: 117 / 92, // 寬高比
        ),
        itemBuilder: (context, index) {
          List<String> images = [
            'assets/images/Record.png',
            'assets/images/friend.png',
            'assets/images/edit.png',
            'assets/images/notify.png'
          ];
          List<String> labels = ['貼文記錄', '好友', '編輯', '通知中心'];
          return _buildGridOption(images[index], labels[index], () {
            _handleGridOptionTap(index); // 傳遞索引到處理函數
          });
        },
      ),
    );
  }

  // 構建網格選項小部件。
  Widget _buildGridOption(String imagePath, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 117, // 設置寬度為 117
        height: 92, // 設置高度為 92
        decoration: BoxDecoration(
          color: Colors.white, // 背景顏色
          borderRadius: BorderRadius.circular(15.0), // 圓角
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 內容垂直居中
          children: [
            Image.asset(
              imagePath, // 圖標圖片路徑
              width: 40.0, // 圖片寬度
              height: 40.0, // 圖片高度
            ),
            SizedBox(height: 8.0), // 增加一個固定高度的空間
            Text(
              label, // 標籤文字
              style: TextStyle(
                fontSize: 16.0, // 字體大小
                color: Color(0xFFA7BA89), // 字體顏色
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 處理網格選項點擊事件
  void _handleGridOptionTap(int index) {
    // 根據索引執行不同的操作
    switch (index) {
      case 0:
        Navigator.pushNamed(context, AppRoutes.postRecord);
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.friendScreen);
        break;
      case 2:
        // 編輯的操作
        Navigator.pushNamed(
          context,
          AppRoutes.setNamePhoto,
          arguments: 'setting',
        );
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.notificationScreen);
        break;
    }
  }
}


/*
後端修改:
- 修改fetchUserData()，從這裡抓後端name和圖片
- 不確定使用者照片用網路存取還是本機的assets 這裡先用NetworkImage 要改 修改103行
*/