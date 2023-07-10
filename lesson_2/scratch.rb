loan_amount =  '15,000'
apr = '5'
loan_duration = '48'

monthly_interest = (apr.to_f / 100) / 12

puts loan_amount
puts apr
puts loan_duration
puts monthly_interest

# m = p * (j / (1 - (1 + j)**(-n)))

monthly_payment = (loan_amount.to_i * (monthly_interest / (1 - (1 + monthly_interest)**(-loan_duration.to_i)))) * 1000

puts monthly_payment.round(2)

