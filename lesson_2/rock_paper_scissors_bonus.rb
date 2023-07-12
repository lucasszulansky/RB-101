VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt "You won!"
  elsif win?(computer, player)
    prompt "The computer won!"
  else
    prompt "It's a tie!"
  end
end

loop do
  choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}."
    prompt "You can type r for rock, s for scissors, p for paper, l for lizard or sp for spock."
    choice = gets.chomp

    case choice
    when choice.downcase.start_with?('r')
      choice = 'rock'
    when choice.downcase.start_with?('s')
      choice = 'scissors'
    when choice.downcase.start_with?('p')
      choice = 'paper'
    when choice.downcase.start_with?('l')
      choice = 'lizard'
    when choice.downcase.start_with?('sp')
      choice = 'spock'
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{choice}; Computer chose: #{computer_choice}."

  display_results(choice, computer_choice)

  prompt "Do you want to play again? Y or N"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing, good bye!"
