require "csv"
$case_pattern = nil

def janken
  puts "じゃんけん..."
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"

  select_number = gets.to_i
  program_number = rand(2)
  jankens = ["グー","チョキ","パー"]

  if jankens[select_number]
    puts "あなた：#{jankens[select_number]}を出しました"
    puts "相手：#{jankens[program_number]}を出しました"

  elsif select_number == 3
    puts "あなたは戦いません"
    exit

  else
    puts "0~3までの数字を入力してください"
    exit
  end

 case
  when select_number == program_number
    puts "あいこで..."
    return true
    
  when (select_number == 0 && program_number == 1)||(select_number ==1 && program_number ==2)||(select_number ==2 && program_number == 0)
    puts "じゃんけんに勝ちました。あっちむいて〜"
    $case_pattern = "win"
    attimuite_hoi
    return false

  else
    puts "じゃんけんに負けました。あっちむいて〜"
    $case_pattern = "lose"
     attimuite_hoi
    return false
  end
end

def attimuite_hoi
    puts "0(上)1(下)2(左)3(右)"

    selecter = gets.to_i 
    program = rand(3)
    directions = ["上","下","左","右"]

    puts "ホイ！"
    puts "あなた：#{directions[selecter]}"
    puts "相手：#{directions[program]}"

    if $case_pattern == "win"
        case
        when selecter == program
            puts "あなたの勝ちです"
            exit
            return false
        else
            puts "引き分けです"
            janken
            return true

        end
    end

    if $case_pattern == "lose"
        case
        when selecter == program
            puts "あなたの負けです"
            return false
        else
            puts "引き分けです"
            janken
            return true

        end
    end
end

next_game = true

while next_game
 next_game = janken 
end

