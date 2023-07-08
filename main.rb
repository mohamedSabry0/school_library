require './app'

def recieve_options
  puts "\n\nPlease choose an option by entering a number:"
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  gets.chomp.to_i
end

def listing(option, app)
  case option
  when 1
    app.list_books
  when 2
    app.list_people
  when 6
    app.list_rentals
  end
end

def add_new(option, app)
  case option
  when 3
    app.add_person
  when 4
    app.create_book
  when 5
    app.create_rental
  end
end

def main
  app = App.new
  puts 'Welcome to School Library App!'
  loop do
    option = recieve_options
    case option
    when 1, 2, 6
      listing(option, app)
    when 3, 4, 5
      add_new(option, app)
    when 7
      break
    else
      puts 'Invalid option'
    end
  end
end

main
