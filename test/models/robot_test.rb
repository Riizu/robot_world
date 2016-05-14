require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_it_assigns_attributes_correctly
    robot = Robot.new({ name: 'Test',
                        city: 'Denver',
                        state: 'Colorado',
                        birth_date: '05/13/2016',
                        date_hired: '05/14/2016',
                        department: 'IT',
                        avatar: 'test_value',
                        id: '1' })

    assert_equal 'Test',       robot.name
    assert_equal 'Denver',     robot.city
    assert_equal 'Colorado',   robot.state
    assert_equal '05/13/2016', robot.birth_date
    assert_equal '05/14/2016', robot.date_hired
    assert_equal 'IT',         robot.department
    assert_equal '1',          robot.id
  end
end
