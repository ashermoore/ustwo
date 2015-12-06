class CommitPage
	def initialize(driver)
		$driver=driver
		class<<self;
			include CommitBody;
		end
	end
end