module CommitBody
	def commiterName
		$driver.find_element(:id ,'com.ustwo.sample:id/commit_detail_textview_name')
	end

	def commiterEmail
		$driver.find_element(:id ,'com.ustwo.sample:id/commit_detail_textview_email')
		end

	def commitDate
		$driver.find_element(:id ,'com.ustwo.sample:id/commit_detail_textview_date')
		end

	def commitMessage
		$driver.find_element(:id ,'com.ustwo.sample:id/commit_detail_textview_message')
	end
end