require './app'

def test_basic_classes
  first = Person.new(14)
  student1 = Student.new(18, 'Ruby')
  teacher1 = Teacher.new(34, 'Math', 'John Doe')
  teacher2 = Teacher.new(44, 'Physics', 'Jack Doe', parent_permission: false)
  p first
  p first.can_use_services?
  p student1.can_use_services?
  student1.age = 21
  p student1
  p student1.play_hooky
  p teacher1
  p teacher1.can_use_services?
  p teacher2
  p teacher2.can_use_services?
end

def test_decorators
  person = Person.new(22, 'maximilianus')
  person.correct_name
  capitalized_person = CapitalizeDecorator.new(person)
  puts capitalized_person.correct_name
  capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
  puts capitalized_trimmed_person.correct_name

  student = Student.new(22, 'CS', 'alexander james')
  capitalized_student = CapitalizeDecorator.new(student)
  puts capitalized_student.correct_name
  capitalized_trimmed_student = TrimmerDecorator.new(capitalized_student)
  puts capitalized_trimmed_student.correct_name
end

def recieve_options
  puts 'Please choose an option by entering a number:'
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
  puts "Welcome to School Library App!\n\n"
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
