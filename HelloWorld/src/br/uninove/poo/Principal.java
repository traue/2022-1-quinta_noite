package br.uninove.poo;

import java.util.Scanner;

public class Principal {

    public static void main(String[] args) {
        //Impressão no console (terminal):
        System.out.println("Olá mundão");

        //declaração de variáveis:
        String nome = "Thiago Traue"; //String serve para textos
        int idade = 34; //int server para números inteiros
        boolean fumante = false; //boolean serve para variáveis lógicas (true | false)
        float altura = 1.83f; //float serve para números reais (ponto flutuante)
        char sexo = 'K'; //caracteres

        //apenas exibindo os dados de forma bonita... concatenando Strings:
        System.out.println("O nome é: " + nome);
        System.out.println("Ah! Legal, você tem " + idade + " anos");
        System.out.println("Show, você tem " + altura + " de altura!");
        System.out.println("Sexo delarado: " + sexo);
        //System.out.println("Você é fumante? " + fumante);

        //desvio condicional
        //if sempre trabalha com condições booleanas
        if (fumante) { //se a cláusula interna for VERDADEIRA é executado o primeiro bloco
            System.out.println("Ah, legal. você é fumante!");
        } else { //senão....
            System.out.println("Show, você não fuma! :D");
        }

        //if ternário
        System.out.println(fumante ? "Fuma muito" : "Não fuma!");

        System.out.println("-----------------------------------");
        
        Scanner sc = new Scanner(System.in);
        
        System.out.print("Informe seu nome: ");
        nome = sc.nextLine(); //para leitura de Strings
        
        System.out.print("Informe sua idade: ");
        idade = sc.nextInt();
        
        System.out.print("Informe sua altura: ");
        altura = sc.nextFloat();

        System.out.print("Informe seu sexo: ");
        sexo = sc.next().charAt(0); 
        
        //o fumante faremos na próxima aula
        
        //imprimindo os valores lidos
        System.out.println("O nome é: " + nome);
        System.out.println("Ah! Legal, você tem " + idade + " anos");
        System.out.println("Show, você tem " + altura + " de altura!");
        System.out.println("Sexo delarado: " + sexo);
        System.out.println(fumante ? "Fuma muito" : "Não fuma!");

    }
}
