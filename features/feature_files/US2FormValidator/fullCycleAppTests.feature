@ustwotests
Feature: Test Automation Engineer Exam

  @ProjectInformation
  Scenario: Test to see if project information is displayed
	Given The full cycle app is open
	Then I will confirm that title of the project is displayed
	And the project is set to public

  @ProjectCommits
  Scenario: Test to see the most recent commits are shown at top and if commit information is present
	Given The full cycle app is open
	Then I will confirm the commit list is present
	And the commits in order of newest to oldest
	And the required information for each commit is present

