package view;

import java.util.ArrayList;
import model.*;

public class Principal {

    public static void main(String[] args) {
        Cliente cliente1 = new Cliente();
        Cliente cliente2 = new Cliente();
            
        cliente1.id = 1;
        cliente1.nome = "Flulano";
        cliente1.email = "flulano@flu.com.br";
        
        cliente2.id = 6;
        cliente2.nome = "Boltrano";
        cliente2.email = "birltraninho@birl.com";
        
        Tecnico tec1 = new Tecnico();
        tec1.id = 10;
        tec1.nome = "Super Mario";
        tec1.departamento = "Infraestrutura";
        
        StatusReclamacao statusConcluida = new StatusReclamacao();
        StatusReclamacao statusPendente = new StatusReclamacao();
        
        statusConcluida.status = "Concluída";
        statusPendente.status = "Pendente";

        Reclamacao rec1 = new Reclamacao();
        rec1.id = 123;
        rec1.assunto = "Roteador não roteia";
        rec1.descricao = "Meu roteador não roteia correamente os pacotes";
        rec1.status = statusPendente;
        rec1.cliente = cliente1;
        rec1.data = "19/05/2022, 21:00";
        
        //alteramos apenas para ver a alteração no objeto dependente
        cliente1.nome = "Fulano Traue";
        
        
        Reclamacao rec2 = new Reclamacao();
        rec2.id = 124;
        rec2.assunto = "Computador Enfeitiçado";
        rec2.descricao = "O computador está fazendo coisas sozinho";
        rec2.status = statusPendente;
        rec2.cliente = cliente2;
        rec2.data = "19/05/2022, 21:37";
           
        ArrayList<Reclamacao> listaDeReclamacoes = new ArrayList<>();
        listaDeReclamacoes.add(rec1);
        listaDeReclamacoes.add(rec2);
        
        tec1.reclamacoes = listaDeReclamacoes;
        
        rec1.status = statusConcluida;
        
    }
}
