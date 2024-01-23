class Livro {
  String titulo;
  String autor;
  bool emprestado;

  Livro(this.titulo, this.autor) : emprestado = false;

  void emprestar() {
    if (emprestado) {
      print("Este livro já está emprestado.");
    } else {
      emprestado = true;
      print("Livro emprestado com sucesso!");
    }
  }

  void devolver() {
    if (!emprestado) {
      print("Este livro não está emprestado.");
    } else {
      emprestado = false;
      print("Livro devolvido com sucesso!");
    }
  }
}