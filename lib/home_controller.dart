import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_objectbox_examples/database/dao/usuario_dao.dart';
import 'package:flutter_objectbox_examples/database/models/usuario_model.dart';

import 'database/dao/pedido_dao.dart';
import 'database/models/pedido_model.dart';

class HomeController {
  final usuarioDAO = UsuarioDAO();
  final pedidoDAO = PedidoDAO();
  final searchTEC = TextEditingController();
  final pageController = PageController();

  Stream<List<Pedido>> get getPedidoListStream => pedidoDAO.getAllPedidoStream;
  final ValueNotifier<List<Pedido>> pedidosPesquisados = ValueNotifier([]);

  void deletePedido(int id) {
    pedidoDAO.removePedido(id);
  }

  void addPedidoRandom() {
    final faker = Faker();
    //cria um novo pedido
    final newPedido = Pedido(
      id: 0,
      productName: faker.food.cuisine(),
    );

    //seta o pedido para um usuário
    final usuarios = usuarioDAO.getAllUsuario();
    if (usuarios.length > 4) {
      //pega um usuário da lista
      final idxUsuarioAleatorio =
          faker.randomGenerator.integer(usuarios.length - 1);
      newPedido.usuario.target = usuarios[idxUsuarioAleatorio];
    } else {
      newPedido.usuario.target = Usuario(
        id: 0,
        name: faker.person.name(),
        vip: faker.randomGenerator.boolean(),
      );
    }

    //salva no banco o pedido
    pedidoDAO.putPedido(newPedido);
  }

  void onNavigationTap(int idx) {
    pageController.animateToPage(
      idx,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  void searchSubmitted() {
    final searchedText = searchTEC.text;
    final pedidos = pedidoDAO.getPedidoByNomeProduto(searchedText);
    searchTEC.clear();

    pedidosPesquisados.value = pedidos;
  }
}
