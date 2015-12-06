Given(/^The full cycle app is open$/) do
  $user=FormValidatorHomePage.new($driver)
  expect(wait{find_exact($user.headerText).displayed?}).to be true
	#click refresh to make double sure we have the most upto date information
	$user.refreshButton.click
end

Then(/^I will confirm that title of the project is displayed$/) do
  expect($user.projectTitle.displayed?).to be true
end

Then(/^the project is set to public$/) do
  expect($user.projectPrivacy.displayed?).to be true
	expect($user.projectPrivacy.attribute('name')).to eq "Public repository"
end

Then(/^I will confirm the commit list is present$/) do
  expect($user.commitList.displayed?).to be true
end

Then(/^the commits in order of newest to oldest$/) do
  dates = []
	$user.commitDate.each do |date|
    dates << date.attribute('text').to_s
	end
	dates.should == dates.sort.reverse
end

Then(/^the required information for each commit is present$/) do
  $user.commitRow.each do |commit|
		commit.click
    $user=CommitPage.new($driver)
    expect($user.commiterName.displayed?).to be true
		expect($user.commiterName.attribute('text')).not_to eq ""
    expect($user.commiterEmail.displayed?).to be true
    expect($user.commiterEmail.attribute('text')).not_to eq ""
    expect($user.commitDate.displayed?).to be true
    expect($user.commitDate.attribute('text')).not_to eq ""
    expect($user.commitMessage.displayed?).to be true
    expect($user.commitMessage.attribute('text')).not_to eq ""
		$driver.press_keycode 4
	end
end
