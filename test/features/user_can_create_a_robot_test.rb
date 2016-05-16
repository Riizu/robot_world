
require_relative '../test_helper'

class UserCanCreateANewRobotTest < FeatureTest

  def test_user_creates_robot
    visit '/robots'

    click_link "Create"

    fill_in 'robot[name]', with: "Robbie the Robot"

    click_button "Submit"

    assert page.has_content?("Robbie the Robot")
  end

end
