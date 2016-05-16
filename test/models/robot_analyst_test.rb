require_relative '../test_helper'

class RobotAnalystTest < Minitest::Test
  def setup
    @ra = RobotAnalyst.new(RobotManager.table)

    @robot_hash_1 = { name: 'Jhonny the Slime',
                      city: 'Denver',
                      state: 'Colorado',
                      birth_date: '1993/17/04',
                      date_hired: '2016/14/05',
                      department: 'IT',
                      avatar: 'test_value' }
    @robot_hash_2 = { name: 'Robbie the Robot',
                      city: 'Fort Collins',
                      state: 'Colorado',
                      birth_date: '1982/22/02',
                      date_hired: '2015/12/05',
                      department: 'IT',
                      avatar: 'test_value' }

    RobotManager.create(@robot_hash_1)
    RobotManager.create(@robot_hash_2)
  end

  def test_it_can_compute_average_robot_age
    average_age = @ra.average_age

    assert_equal 29, average_age
  end

  def test_it_can_compute_num_robots_hired_per_year
    num_robots = @ra.num_per_year

    assert_equal [[2015, 1], [2016, 1]] , num_robots.sort
  end

  def test_it_can_compute_num_robots_per_city
    num_robots = @ra.num_per_city

    assert_equal [["Denver", 1], ["Fort Collins", 1]] , num_robots.sort
  end

  def test_it_can_compute_num_robots_per_state
    num_robots = @ra.num_per_state

    assert_equal [["Colorado", 2]] , num_robots.sort
  end

  def test_it_can_compute_num_robots_per_department
    num_robots = @ra.num_per_department

    assert_equal [["IT", 2]] , num_robots.sort
  end
end
