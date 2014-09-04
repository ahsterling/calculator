def calculate(f, a, b=nil)
  if f == "+"
    add(a, b)
  elsif f == "-"
    subtract(a, b)
  elsif f == "*"
    multiply(a, b)
  elsif f == "/"
    divide(a.to_f, b.to_f)
  elsif f == "^"
    exponent(a, b)
  elsif  f == "√"
    root(a)
  else
    nil
  end
end

def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def multiply(a, b)
  a * b
end

def divide(a, b)
  a / b
end

def exponent(a, b)
  a ** b
end

def root(a)
  Math.sqrt(a)
end

def oper(op)
    if op[0..2].downcase == "add" or op == "+"
      "+"
    elsif op[0..2].downcase == "sub" or op == "-"
      "-"
    elsif op[0..2].downcase == "mul" or op == "*"
      "*"
    elsif op[0..2].downcase == "div" or op == "/"
      "/"
    elsif op[0..2].downcase == "exp" or op == "^"
      "^"
    elsif op[0..2].downcase == "squ"
      "√ "
    else
      nil
    end
end


def is_num(num)
  if ("0" .. "9").include? num[0]
    num.chomp.to_i
  elsif num == "\n"
    num.chomp.to_i
  else
    abort("That's not a number, see ya!")
  end
end


def next_op(stored_num)
  puts "What kind of operation should we do? "
  input = gets.chomp
  ex = oper(input)

  if ex.nil?
    puts "That's not valid! Sorry!"
    exit
  end

  while stored_num == nil
    puts "What is the first number?"
    stored_num = gets.chomp
    stored_num = is_num(stored_num)
  end

  if ex != "√"
    puts "What is the next number we should use?"
    n1 = gets.chomp
    n1 = is_num(n1)
    answer = calculate(ex, stored_num, n1)
    puts "#{stored_num} #{ex} #{n1} = #{answer}"
    return answer
  elsif ex == "√"
    answer = calculate(ex, stored_num)
    puts "#{ex} #{num1} = #{answer}"
    return answer
  else
    nil
  end

end


def run()
  puts "Hello, welcome to my calculator!"
  response = "y"
  result = nil

  while response[0].downcase == "y"
    result = next_op(result)
    puts "Do you want to do another operation with this result?"
    response = gets.chomp
  end

end


run()
