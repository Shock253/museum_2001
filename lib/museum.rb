class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit_name)
    @exhibits << exhibit_name
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    @exhibits.reduce({}) do |patrons_by_interest, exhibit|
      if !patrons_by_interest.has_key?(exhibit)
        patrons_by_interest[exhibit] = []
      end

      @patrons.each do |patron|
        if recommend_exhibits(patron).include?(exhibit)
          patrons_by_interest[exhibit] << patron
        end
      end

      patrons_by_interest
    end
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.find_all do |patron|
      patron.spending_money < exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    eligible_patrons = ticket_lottery_contestants(exhibit)
    winner = Random.rand(0..(eligible_patrons.length - 1))
    eligible_patrons[winner].nil? ? nil : eligible_patrons[winner].name 
  end
end
