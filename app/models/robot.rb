class Robot
  attr_reader :name, :city, :state, :birth_date,
              :date_hired, :department, :avatar, :id

  def initialize(robot_data)
    @id         = robot_data[:id]
    @name       = robot_data[:name]
    @city       = robot_data[:city]
    @state      = robot_data[:state]
    @birth_date = robot_data[:birth_date]
    @date_hired = robot_data[:date_hired]
    @department = robot_data[:department]
    @avatar     = robot_data[:avatar]
  end
end
