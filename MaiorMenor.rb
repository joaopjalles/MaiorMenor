def boas_vindas
  puts"Bem vindo ao jogo da adivinhação"
  puts"Qual é o seu nome?"
  nome = gets.strip
  puts "\n\n\n\n\n"
  puts"Começaremos o jogo para você, " + nome
end

def sorteia_numero_secreto
  puts"Escolhendo um numero secreto entre 0 a 200..."
  sorteado = 111
  puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
  sorteado
end

def pede_numero( chutes, tentativa, limite_tentativas)
  puts "\n\n\n\n\n"
  puts"Tentativa " + tentativa.to_s + " de " + limite_tentativas.to_s
  puts "Chutes até agora: " + chutes.to_s
  puts"Entre com o numero"
  chutes = gets.strip
  puts "Será que acertou? Você chutou " + chutes
  chutes.to_i
end

def verifica_se_acertou(numero_secreto, chutes)
  acertou = numero_secreto == chutes.to_i

  if acertou
    puts "Acertou!"
    return true
  end
    maior = numero_secreto > chutes.to_i
    if maior
      puts "O número secreto é maior!"
    else
      puts "O número secreto é menor!"
    end
  false
end

boas_vindas
numero_secreto = sorteia_numero_secreto

limite_tentativas = 5
chutes = []

for tentativa in 1..limite_tentativas
  chutes = pede_numero chutes, tentativa, limite_tentativas
  chutes << chutes

  if verifica_se_acertou numero_secreto, chutes
    break
  end
end

