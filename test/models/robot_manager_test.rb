require_relative '../test_helper'

class RobotManagerTest < Minitest::Test

  def setup
    @robot_hash_1 = { name: 'Test',
                      city: 'Denver',
                      state: 'Colorado',
                      birth_date: '05/13/2016',
                      date_hired: '05/14/2016',
                      department: 'IT',
                      avatar: 'test_value' }
    @robot_hash_2 = { name: 'Robbie the Robot',
                      city: 'Denver',
                      state: 'Colorado',
                      birth_date: '05/13/2016',
                      date_hired: '05/14/2016',
                      department: 'IT',
                      avatar: 'test_value' }
  end

  def test_it_has_a_table
    assert RobotManager.table
  end

  def test_it_creates_a_robot
    id = RobotManager.create(@robot_hash_1)

    robot = RobotManager.find(id)

    assert_equal 'Test',       robot.name
    assert_equal 'Denver',     robot.city
    assert_equal 'Colorado',   robot.state
    assert_equal '05/13/2016', robot.birth_date
    assert_equal '05/14/2016', robot.date_hired
    assert_equal 'IT',         robot.department
    assert_equal id,           robot.id

  end

  def test_it_can_find_a_robot_by_id
    id_1 = RobotManager.create(@robot_hash_1)
    id_2 = RobotManager.create(@robot_hash_2)

    robot_1 = RobotManager.find(id_1)
    robot_2 = RobotManager.find(id_2)

    assert_equal 'Test', robot_1.name
    assert_equal 'Robbie the Robot', robot_2.name
  end

  def test_it_gets_all_robots
    RobotManager.create(@robot_hash_1)
    RobotManager.create(@robot_hash_2)

    assert_equal 2, RobotManager.all.count
  end

  def test_it_can_update_a_robot
    id = RobotManager.create(@robot_hash_1)

    assert_equal "Test", RobotManager.find(id).name

    RobotManager.update(id, @robot_hash_2)

    assert_equal "Robbie the Robot", RobotManager.find(id).name
  end

  def test_it_can_delete_a_robot
    id = RobotManager.create(@robot_hash_1)

    assert_equal 1, RobotManager.all.count

    RobotManager.delete(id)

    assert_equal 0, RobotManager.all.count
  end
end
