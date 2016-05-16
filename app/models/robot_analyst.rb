class RobotAnalyst
  def initialize(table)
    @table = table
  end

  def get_table_column_data(column)
    @table.collect { |data| data[column] }
  end

  def convert_to_dates(column_data)
    get_table_column_data(column_data).map do |date|
      Time.new(date)
    end
  end

  def average_age
    ages = convert_to_dates(:birth_date).map { |year| Time.now - year}
    (ages.reduce(:+)/ages.length/31536000).round
  end

  def num_per_year
    year_occurrances = convert_to_dates(:date_hired).group_by {|date| date.year}
    year_occurrances.map { |year, occurrances| [year, occurrances.count]}
  end

  def num_per_city
    city_occurences = get_table_column_data(:city).group_by {|city| city}
    city_occurences.map {|city, occurences| [city, occurences.count]}
  end

  def num_per_state
    state_occurences = get_table_column_data(:state).group_by {|state| state}
    state_occurences.map {|state, occurences| [state, occurences.count]}
  end

  def num_per_department
    departments = get_table_column_data(:department).group_by {|department| department}
    departments.map {|department, occurences| [department, occurences.count]}
  end
end
