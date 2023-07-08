require './classes/person'
require './classes/student'
require './classes/teacher'
require './classes/capitalize_decorator'
require './classes/trimmer_decorator'
require './classes/classroom'
require './classes/book'
require './classes/rental'

class App
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    Book.new(title, author)
  end

  def add_person
    print 'Do you want to add a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i
    case person_type
    when 1
      add_student
    when 2
      add_teacher
    else
      puts 'Invalid option'
    end
    puts 'Person added successfully'
  end

  def add_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(age, name, specialization)
  end

  def add_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase == 'y'
    Student.new(age, name, permission)
  end

  def list_people
    Person.all.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_books
    Book.all.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    Book.all.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    book = Book.all[book_index]
    puts 'Select a person from the following list by number (not ID)'
    Person.all.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    person = Person.all[person_index]
    print 'Date: '
    date = gets.chomp
    Rental.new(date, book, person)

    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    person = Person.find(id)
    puts 'Rentals: '
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
