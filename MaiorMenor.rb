def boas_vindas
  puts"Bem vindo ao jogo da adivinhação"
  puts"Qual é o seu nome?"
  nome = gets.strip
  puts "\n\n\n\n\n"
  puts"Começaremos o jogo para você, #{nome}"
  nome
end

def pede_dificuldade
  puts "Qual o nível de dificuldade que deseja? (1 fácil, 5 difícil)"
  dificuldade = gets.to_i
end
def sorteia_numero_secreto (dificuldade)
  case dificuldade
  when 1
    maximo = 30
  when 2
    maximo = 60
  when 3
    maximo = 100
  when 4
    maximo = 150
  else
    maximo = 200
  end
  puts "Escolhendo um numero secreto entre 1 a #{maximo}..."
  sorteado = rand(maximo) + 1
  puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
  sorteado
end

def pede_numero( chutes, tentativa, limite_tentativas)
  puts "\n\n\n\n\n"
  puts "Tentativa #{tentativa} de #{limite_tentativas}"
  puts "Chutes até agora: #{chutes}"
  puts"Entre com o numero"
  chutes = gets.strip
  puts "Será que acertou? Você chutou #{chutes}"
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

def joga(nome, dificuldade)
  numero_secreto = sorteia_numero_secreto dificuldade

  pontos_ate_agora = 1000
  limite_tentativas = 5
  chutes = []

  for tentativa in 1..limite_tentativas

    chutes = pede_numero chutes, tentativa, limite_tentativas
    chutes << chutes

    if nome == "jp"
      puts "Acertou!"
      break
    end

    pontos_a_perder = (chutes - numero_secreto) / 2.0
    pontos_ate_agora -= pontos_a_perder

    if verifica_se_acertou numero_secreto, chutes
      break
    end
  end

  puts "Voçê ganhou #{pontos_ate_agora} pontos."
end

def nao_quero_jogar?
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip
  nao_quero_jogar = quero_jogar.upcase == "N"
end
nome = boas_vindas
dificuldade = pede_dificuldade

loop do
  joga nome, dificuldade
  if nao_quero_jogar?
    break
  end
end

