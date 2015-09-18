feature 'Login' do
  # As a registered user
  # I want to be able to login

  before do
    Given 'I am registered user'
  end

  scenario 'Successfull login with username' do
    When 'I am on the home page'
    And 'I click on login link'
    And 'I submit my username and password'
    Then 'I should be on the dashboard page'
  end

  scenario 'Successfull login with email' do
    When 'I am on the home page'
    And 'I click on login link'
    And 'I submit my email and password'
    Then 'I should be on the dashboard page'
  end

  scenario 'Unsuccessfull login' do
    When 'I am on the home page'
    And 'I click on login link'
    And 'I submit my email and wrong password'
    Then 'I should be on the login page'
    And 'I should see form errors'
  end

end
