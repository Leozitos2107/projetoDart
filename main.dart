import 'dart:io';
import 'biblioteca.dart';
import 'livro.dart';
import 'cliente.dart';

void main() {
  bool isContinue = true;
  print("Bem-vindo à Biblioteca virtual!");
  print("Qual seu nome?");
  String nomeCliente = stdin.readLineSync()!;
  Cliente cliente = Cliente(nomeCliente);
   
  Biblioteca biblioteca = Biblioteca();
  biblioteca.livros.add(Livro("Bocejo", "Leozitos"));
  biblioteca.livros.add(Livro("Garrafa de Metal", "Davos"));
  biblioteca.livros.add(Livro("Vinicius Jr.", "Felipocks"));
  
  while(isContinue){
  
  print("_______________________________________________________");
  print("1. Adicionar um livro");
  print("2. Devolver um livro");
  print("3. Verificar se um livro está emprestado");
  print("4. Pegar um livro emprestado");
  print("5. Ver histórico de empréstimos");
  print("6. Sair");
  print("Qual opção você gostaria?");
  print("_______________________________________________________");
  
  int opcao = int.parse(stdin.readLineSync()!);


  switch (opcao) {
     case 1:
      print(Process.runSync("clear", [], runInShell: true).stdout);
      print("Você escolheu: Você quer adicionar um livro");
      print("Digite o título do livro:");
      String tituloLivro = stdin.readLineSync()!;
      print("Digite o autor do livro:");
      String autorLivro = stdin.readLineSync()!;
      Livro novoLivro = Livro(tituloLivro, autorLivro);
      biblioteca.adicionarLivro(novoLivro);
      print("Livro adicionado com sucesso!");
      break;
    case 2:
      print(Process.runSync("clear", [], runInShell: true).stdout);
      print("Você escolheu: Devolver um livro");
      cliente.exibirHistorico();
      print("Digite o título do livro que deseja devolver:");
      String tituloLivro = stdin.readLineSync()!;

      for (Livro livro in cliente.historicoEmprestimos){
        if (tituloLivro == livro.titulo){
          cliente.devolverLivro(livro);
          break; 
        }
      }
      break;
      
    case 3:
      print(Process.runSync("clear", [], runInShell: true).stdout);
      print("Você escolheu: Verificar se um livro está emprestado");
      biblioteca.listarLivrosDisponiveis();
      print("Digite o título do livro que deseja verificar:");
      String tituloLivro = stdin.readLineSync()!;
      Livro livroSelecionado = biblioteca.livros.firstWhere((livro) => livro.titulo == tituloLivro);
      if (livroSelecionado != null) {
        if (livroSelecionado.emprestado) {
          print("O livro '$tituloLivro' está emprestado.");
        } else {
        print("O livro '$tituloLivro' está disponível para empréstimo.");
        }
      } else {
      print("Livro não encontrado na biblioteca.");
      }
      break;
    case 4:
      print(Process.runSync("clear", [], runInShell: true).stdout);
      print("Você escolheu: Pegar um livro emprestado");
      biblioteca.listarLivrosDisponiveis();
      print("Digite o título do livro que deseja emprestar:");
      String tituloLivro = stdin.readLineSync()!;
      Livro livroSelecionado = biblioteca.buscarLivro(tituloLivro);
      if (!livroSelecionado.titulo.isEmpty) {
        cliente.emprestarLivro(livroSelecionado);
      } else {
        print("Livro não encontrado na biblioteca.");
      }
      break;
    case 5:
      print(Process.runSync("clear", [], runInShell: true).stdout);
      print("Você escolheu: Você gostaria de ver seu histórico?");
      cliente.exibirHistorico();
      break;
    case 6:
      print(Process.runSync("clear", [], runInShell: true).stdout);
      isContinue = false;
      break;
    default:
      print("Opção inválida. Por favor, escolha uma opção válida.");
  }
  }
}