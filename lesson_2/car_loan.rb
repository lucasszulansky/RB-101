# ask the user for the loan ammount
# ask the user for the Annual Percentage Rate (APR)
# ask the user for the loan duration
# calculate monthly interest rate by converting the APR to the monthly interest rate
# calculate the loan duration in months
# calculate the monthly payment

# the formula is m = p * (j / (1 - (1 + j)**(-n)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

def prompt(message)
  puts " => #{message}"
end

def integer?(input) # validates integers
  input.to_i.to_s == input
end

def float?(input) # validates floats
  input.to_f.to_s == input
end

def number?(input) # validates integers or floats
  integer?(input) || float?(input)
end

prompt "Welcome to the auto loan calculator!"

loop do # main loop

  loan_amount = ''

  loop do # loan amount & validation
    prompt "Enter the total loan amount in US dollars (with no commas)."
    print '$'

    loan_amount = gets.chomp
    if number?(loan_amount)
      break
    else
      prompt "Please try again and enter a valid loan amount."
      sleep 1
    end
  end

  prompt "Your loan amount has been set to $#{loan_amount}."
  sleep 1

  apr = ''

  loop do # APR amount and validation
    prompt "Enter the Annual Percentage Rate (APR) for your loan as a percentage"
    prompt "(without including %)."
    prompt "(for example, 5.5)"

    apr = gets.chomp
    if number?(apr)
      break
    else
      prompt "Please try again and ender enter a valid APR rate."
      sleep 1
    end
  end

  prompt "Your APR amount has been set to #{apr}%."
  sleep 1

  loan_duration = ''

  loop do
    prompt "Enter the loan duration in months"
    prompt "(for example, 5 years = 60 months)"

    loan_duration = gets.chomp
    if number?(loan_duration)
      break
    else
      prompt "Please try again and ender enter a valid loan duration."
      sleep 1
    end
  end

  prompt "Your loan duration has been set to #{loan_duration} months."
  sleep 1

  monthly_interest = (apr.to_f / 100) / 12

  monthly_payment = (loan_amount.to_i * (monthly_interest / (1 - (1 + monthly_interest)**(-loan_duration.to_i)))).round(2)

  prompt "Your monthly payment is $#{monthly_payment}."
  sleep 1
  prompt "Would you like to calculate another loan?"
  prompt "(enter Y to calculate again)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end


prompt "Thank you for using the car loan calculator."