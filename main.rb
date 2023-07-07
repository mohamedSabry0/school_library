require './person'
require './student'

def main
  first = Person.new(14)
  second = Student.new(18, 'Ruby')
  p first, second
  p first.can_use_services?
  p second.can_use_services?
  second.age = 21
  p second
  p second.play_hooky
end

main
