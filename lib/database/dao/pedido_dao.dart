import 'package:flutter_objectbox_examples/main.dart';
import 'package:flutter_objectbox_examples/objectbox.g.dart';

import '../models/pedido_model.dart';

class PedidoDAO {
  ///cria uma Stream que observa todos os evendos do box Pedido
  Stream<List<Pedido>> get getAllPedidoStream => objectbox.store
      .box<Pedido>()
      .query()
      .watch(triggerImmediately: true)
      .map((event) => event.find());

  ///pesquisar pedidos pelo nome de produto

  int putPedido(
    Pedido pedido,
  ) {
    final box = objectbox.store.box<Pedido>();
    return box.put(pedido);
  }

  Pedido? getPedido(
    int id,
  ) {
    final box = objectbox.store.box<Pedido>();
    return box.get(id);
  }

  List<Pedido> getAllPedido(
    int id,
  ) {
    final box = objectbox.store.box<Pedido>();
    return box.getAll();
  }

  bool removePedido(
    int id,
  ) {
    final box = objectbox.store.box<Pedido>();
    return box.remove(id);
  }

  int countPedido(
    int id,
  ) {
    final box = objectbox.store.box<Pedido>();
    return box.count();
  }

  List<Pedido> getPedidoByNomeProduto(String searchedText) {
    final box = objectbox.store.box<Pedido>();

    final query = box
        .query(
          Pedido_.productName.contains(searchedText),
        )
        .build();
    final pedidos = query.find();

    query.close();

    return pedidos;
  }
}
