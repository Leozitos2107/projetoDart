import 'livro.dart';

class Biblioteca {
  List<Livro> livros = [];

  void adicionarLivro(Livro livro) {
    livros.add(livro);
  }
  
  Livro buscarLivro(String tituloLivro){
     return livros.firstWhere(
    (livro) => livro.titulo == tituloLivro,
    orElse: () => Livro("", "")
  );
  
  }

  void removerLivro(Livro livro) {
    livros.remove(livro);
  }

  void listarLivrosDisponiveis() {
    print("Livros disponíveis na biblioteca:");
    for (var livro in livros) {
      if (!livro.emprestado) {
        print("- ${livro.titulo} por ${livro.autor}");
      }
    }
  }
}