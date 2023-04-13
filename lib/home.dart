import 'package:flutter/material.dart';
import 'package:flutter_objectbox_examples/pages/pedidos_by_search_page.dart';

import 'home_controller.dart';
import 'pages/pedidos_by_stream_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        actions: [
          IconButton(
            onPressed: controller.addPedidoRandom,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: controller.onNavigationTap,
        selectedItemColor: Colors.grey.shade600,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.stream),
            label: 'Stream',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisa',
          ),
        ],
      ),
      body: PageView(
        controller: controller.pageController,
        children: [
          PedidosListByStream(controller: controller),
          PedidosListBySearch(controller: controller),
        ],
      ),
    );
  }
}
