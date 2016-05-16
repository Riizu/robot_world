require_relative '../test_helper'

class UserCanSeeAllRobotsTest < FeatureTest
  def test_user_can_see_all_the_robots
    RobotManager.create({name: "Tommy", city: "New York", state: "New York",
                         birth_date: "10/20/1981", date_hired: "03/16/2015",
                         department: "Custodial"})
    RobotManager.create({name: "Sally", city: "Cheyenne", state: "Wyoming",
                         birth_date: "9/20/1990", date_hired: "01/23/2014",
                         department: "Management"})

    visit '/robots'

    assert page.has_content?('Tommy')
    assert page.has_content?('Sally')
  end
end
