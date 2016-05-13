require 'securerandom'

class RobotManager
  def self.database
    if ENV['ROBOT_MANAGER_ENV'] == 'test'
      @database = Sequel.postgres('robot_manager_test')
    else
      @database = Sequel.postgres('robot_manager')
    end
  end

  def self.create(robot)
    id = table.insert(robot)
    locate(id).update(avatar: SecureRandom.hex)
  end

  def self.table
    database.from(:robots)
  end

  def self.locate(id)
    table.where(id: id)
  end

  def self.all
    table.to_a.map { |row| Robot.new(row) }
  end

  def self.raw_robot(id)
    locate(id).to_a.first
  end

  def self.find(id)
    Robot.new(raw_robot(id))
  end

  def self.update(id, robot)
    locate(id).update(robot)
  end

  def self.delete(id)
    locate(id).delete
  end

  def self.delete_all
    table.delete
  end

  def self.generate_new_avatar(id)
    locate(id).update(avatar: SecureRandom.hex)
  end
end
