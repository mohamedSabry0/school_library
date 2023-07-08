require './person'
require './student'
require './teacher'

def main
  first = Person.new(14)
  student1 = Student.new(18, 'Ruby')
  teacher1 = Teacher.new(34, 'Math', 'John Doe')
  teacher2 = Teacher.new(44, 'Physics', 'Jack Doe', false)
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

main
