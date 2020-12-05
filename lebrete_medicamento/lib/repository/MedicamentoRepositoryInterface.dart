import 'package:lebrete_medicamento/model/medicamentoModel.dart';

abstract class IMedicamentoRepository {
  // cadastrar
  Future<bool> cadastrar(MedicamentoModel model);
  // listar medicamentos
  Future<List<MedicamentoModel>> listar();
}
