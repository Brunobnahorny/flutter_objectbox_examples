import 'package:flutter/material.dart';

import 'package:flutter_objectbox_examples/database/models/pedido_model.dart';
import 'package:flutter_objectbox_examples/home_controller.dart';

class PedidosListByStream extends StatelessWidget {
  final HomeController controller;

  const PedidosListByStream({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.getPedidoListStream,
      builder: (context, snapshot) {
        final rowValues = snapshot.hasError || !snapshot.hasData
            ? <Pedido>[]
            : snapshot.data!;

        return Table(
          border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(64),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
            3: FixedColumnWidth(84),
            4: FixedColumnWidth(84),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            _buildHeaderCells(),
            ..._buildRows(rowValues),
          ],
        );
      },
    );
  }

  TableRow _buildHeaderCells() {
    return const TableRow(children: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('id'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Produto'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Usuário'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('VIP?'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Remover'),
      ),
    ]);
  }

  List<TableRow> _buildRows(List<Pedido> rowValues) {
    final tableRows = rowValues
        .map(
          (e) => TableRow(
            children: _buildPedidoRowCells(e),
          ),
        )
        .toList();
    return tableRows;
  }

  List<Widget> _buildPedidoRowCells(Pedido pedido) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(pedido.id.toString()),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(pedido.productName),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(pedido.usuario.target!.name),
      ),
      Container(child: pedido.usuario.target!.vip ? const FlutterLogo() : null),
      IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => controller.deletePedido(pedido.id),
      ),
    ];
  }
}
