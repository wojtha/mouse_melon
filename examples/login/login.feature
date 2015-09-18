Feature: Login
  As a registered user
  I want to be able to login

  Background:
    Given I am registered user

  Scenario: Successfull login with username
    When I am on the home page
    And I click on login link
    And I submit my username and password
    Then I should be on the dashboard page

  Scenario: Successfull login with email
    When I am on the home page
    And I click on login link
    And I submit my email and password
    Then I should be on the dashboard page

  Scenario: Unsuccessfull login
    When I am on the home page
    And I click on login link
    And I submit my email and wrong password
    Then I should be on the login page
    And I should see form errors
