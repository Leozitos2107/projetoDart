import 'livro.dart';
class Cliente {
  String nome;
  List<Livro> historicoEmprestimos = [];

  Cliente(this.nome);

  void emprestarLivro(Livro livro) {
    if (!livro.emprestado) {
      livro.emprestar();
      historicoEmprestimos.add(livro);
    } else {
      print("Desculpe, o livro já está emprestado.");
    }
  }

  void devolverLivro(Livro livro) {
    if (livro.emprestado) {
      livro.devolver();
      historicoEmprestimos.remove(livro);
    } else {
      print("O livro não está emprestado para este cliente.");
    }
  }

  void exibirHistorico() {
    print("Histórico de Empréstimos para $nome:");
    for (var livro in historicoEmprestimos) {
      print("- ${livro.titulo}");
    }
  }
}
