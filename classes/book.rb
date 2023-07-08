class Book
  attr_accessor :title, :author, :rentals

  @all = []
  self.class.public_send(:attr_reader, :all)

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    self.class.all << self
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end
end
