class Patron
  attr_reader :name,
              :spending_money,
              :intrests

  def initialize(name, spending_money)
    @name = name
    @spending_money = spending_money
    @intrests = []
  end
end
