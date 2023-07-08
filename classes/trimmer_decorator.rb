require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name[0..19]
  end
end
