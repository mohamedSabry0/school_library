require './classes/person'
require './classes/student'
require './classes/teacher'
require './classes/capitalize_decorator'
require './classes/trimmer_decorator'

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

  student = Student.new(22, 'CS', 'alexander james maxwell the third')
  capitalized_student = CapitalizeDecorator.new(student)
  puts capitalized_student.correct_name
  capitalized_trimmed_student = TrimmerDecorator.new(capitalized_student)
  puts capitalized_trimmed_student.correct_name
end

def main
  test_basic_classes

  test_decorators
end

main
