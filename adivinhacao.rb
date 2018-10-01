#Puts = Saida na tela
#gets = Entrada do teclado
#variavel.to_i = convertendo variável para inteiro
#variavel.to_s = convertendo variável para string
#variavel.strip = Retira qqr caracter especial como branco, nova linha do inicio e do fim da string
#puts "Sua variável é #{variavel}" =   interpolaçao de string usando vaariáveis
=begin
    def nome_da_funcao
        codigo ...
    end
=end

def da_boas_vindas
    puts "Bem vindo ao jogo da advinhação!";
    puts "Qual seu nome jogador?";
    nome = gets.strip; 
    puts "\n\n\n\n\n\n";
    puts "Começaremos o jogo para você, #{nome}";
end

def sorteia_numero_secreto
    puts "Escolhendo número secreto entre 0 e 200 . . .";
    sorteado = rand(0..200);
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

def verifica_se_acertou(chute, numero_secreto)
    acertou = chute == numero_secreto;
    if acertou
        puts "Acertou"
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

da_boas_vindas
numero_secreto = sorteia_numero_secreto

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