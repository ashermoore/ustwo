module AppBody
	def projectTitle
		$driver.find_element(:id ,'com.ustwo.sample:id/commit_list_textview_title')
	end

	def projectPrivacy
		$driver.find_element(:id, 'com.ustwo.sample:id/commit_list_imageview_privacy_state')
	end

	def commitList
		$driver.find_element(:id, 'com.ustwo.sample:id/commit_list_listview_commits')
	end

	def commitRow
		$driver.find_elements(:id, "com.ustwo.sample:id/commit_list_linearlayout_row")
	end

	def commitMessage
		$driver.find_element(:id, 'com.ustwo.sample:id/commit_list_row_textview_message')
	end

	def commitDate
		$driver.find_elements(:id, 'com.ustwo.sample:id/commit_list_row_textview_date')
	end
end