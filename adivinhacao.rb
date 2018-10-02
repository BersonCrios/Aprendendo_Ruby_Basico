#Puts = Saida na tela
#gets = Entrada do teclado
#variavel.to_i = convertendo variável para inteiro
#variavel.to_s = convertendo variável para string
#variavel.strip = Retira qqr caracter especial como branco, nova linha do inicio e do fim da string
#puts "Sua variável é #{variavel}" =   interpolaçao de string usando vaariáveis
#unless é o inverso do if   
=begin
    def nome_da_funcao
        codigo ...
    end
=end


def da_boas_vindas
    puts
    puts "        P  /_\  P                              "
    puts "       /_\_|_|_/_\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \__|_|__/                              "
    puts
    puts "Qual seu nome jogador?";
    nome = gets.strip; 
    puts "\n\n\n\n\n\n";
    puts "Começaremos o jogo para você, #{nome}";
    return nome;
end

def pede_dicifuldade
    puts "Qual o nível de dificuldade?"
     puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
     puts "Escolha: "
     return dificuldade = gets.to_i;
end

def sorteia_numero_secreto(dificuldade)
    case dificuldade
    when 1
        maximo = 30;
    when 2 
        maximo = 60;
    when 3 
        maximo = 100;
    when 4 
        maximo = 150;
    else
        maximo = 200;
    end
    puts "Escolhendo número secreto entre 1 e #{maximo} . . .";
    sorteado = rand(0..maximo)+1;
    puts "Escolhido ... Que tal advinha o nosso número secreto ?";
    puts sorteado;
    return sorteado;
end

def pede_um_numero(chutes, tentaiva, limite_de_tentativas)
    puts "\n\n\n\n";
    puts "Tentativa #{tentaiva} de #{limite_de_tentativas}";
    puts "Chutes até agora: #{chutes}";
    puts "Entre com um número";
    chute = gets.strip;
    puts "Será que acertou ? você chutou #{chute}.";
    return chute.to_i
end

def ganhou
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
  end

def verifica_se_acertou(chute, numero_secreto)
    acertou = chute == numero_secreto;
    if acertou
        ganhou
        return true
    end
    maior = numero_secreto > chute
        if maior
            puts "O numero secreto e maior"
        else
            puts "O numero secreto é menor"
        end
        return false
end

def joga(nome, dificuldade)
    numero_secreto = sorteia_numero_secreto(dificuldade);
    pontos_ate_agora = 1000;
    limite_de_tentativas = 5;
    chutes = [];

    for i in 1..limite_de_tentativas
    chute = pede_um_numero(chutes, i, limite_de_tentativas);
    chutes << chute;

    pontos_a_perder = (chute - numero_secreto).abs / 2.0;

    pontos_ate_agora -= pontos_a_perder;

    if verifica_se_acertou(chute, numero_secreto)
            break
    end
end

puts "Voçe ganhou #{pontos_ate_agora} pontos. ";
end

def nao_quer_jogar?
    puts "deseja jogar novamente? (S/N)";
    quero_jogar = gets.strip;
    nao_quero_jogar = quero_jogar.upcase ==  "N";
end

nome = da_boas_vindas;
dificuldade = pede_dicifuldade;

loop do
    joga(nome, dificuldade);
    if nao_quer_jogar?
        break
    end
end