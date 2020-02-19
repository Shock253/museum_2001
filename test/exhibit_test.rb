require "minitest/autorun"
require "minitest/pride"
require "./lib/exhibit"

class ExhibitTest < Minitest::Test

  def setup
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end

  def test_it_exists
    assert_instance_of Exhibit, @exhibit
  end

  def test_it_has_attributes
    assert_equal "Gems and Minerals", @exhibit.name
    assert_equal 0, @exhibit.cost
  end
  
end


# pry(main)> require './lib/exhibit'
# # => true

# pry(main)> exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
# # => #<Exhibit:0x00007fcb13bd22d0...>
#
# pry(main)> exhibit.name
# # => "Gems and Minerals"
#
# pry(main)> exhibit.cost
# # => 0
