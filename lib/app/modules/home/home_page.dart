import 'package:flutter/material.dart';
import 'package:nagazap/app/core/app_colors.dart';
import 'package:nagazap/app/core/app_route.dart';
import 'package:nagazap/app/core/app_text_styles.dart';
import 'package:nagazap/app/modules/home/home_controller.dart';
import 'package:nagazap/app/repositories/user_repository.dart';
import 'package:nagazap/app/services/auth_service.dart';
import 'package:nagazap/app/shared/models/user.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = HomeController(
        context.watch<UserRepository>(), context.watch<AuthService>());
    return Scaffold(
      appBar: PreferredSize(
        child: ValueListenableBuilder<bool>(
          valueListenable: controller.isSearch,
          builder: (_, value, ___) => Container(
            color: AppColors.PURPLE,
            padding: const EdgeInsets.only(left: 20),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!value)
                  Text(
                    'NagaZap',
                    style: AppTextStyles.APP_BAR_TEXT,
                  ),
                if (value)
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      controller: controller.searchName,
                      decoration: InputDecoration(
                        hintText: 'Procure por alguém...',
                      ),
                      style: TextStyle(color: AppColors.WHITE),
                      onSubmitted: (value) {
                        controller.setIsSearch = false;
                      },
                    ),
                  ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: AppColors.WHITE,
                      ),
                      onPressed: () {
                        controller.setIsSearch = true;
                      },
                    ),
                    PopupMenuButton(
                      onSelected: (value) async {
                        if (value == 'logout') {
                          await controller.logout(context);
                        }
                      },
                      icon: Icon(
                        Icons.more_vert_outlined,
                        color: AppColors.WHITE,
                      ),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: 'logout',
                            child: ListTile(
                              leading: Icon(
                                Icons.exit_to_app,
                                color: Colors.red,
                              ),
                              title: Text('logout'),
                            ),
                          )
                        ];
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: 30,
        separatorBuilder: (_, __) => Divider(height: 0),
        itemBuilder: (__, index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.ROOM,
                arguments: User(id: 'teste', name: 'Dáwid Oliveira'),
              );
            },
            title: Text('Dawid Oliveira'),
            leading: Icon(Icons.person),
            subtitle: Text('Tudo bem?'),
            trailing: Text('22:03'),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Conversas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}
