require './person'

def main
  first = Person.new(14)
  second = Person.new(18)
  p first, second
  p first.can_use_services?
  p second.can_use_services?
end

main
