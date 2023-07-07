require './person'
require './student'
require './teacher'

def main
  first = Person.new(14)
  second = Student.new(18, 'Ruby')
  teacher1 = Teacher.new('Jack', 45, 'Math')
  p first, second
  p first.can_use_services?
  p second.can_use_services?
  second.age = 21
  p second
  p second.play_hooky
  p teacher1
  p teacher1.can_use_services?
end

main
