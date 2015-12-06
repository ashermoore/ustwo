module AppHeader
    def headerText
      headerText ='US2FormValidator'
      return headerText
    end

    def refreshButton
      $driver.find_element(:id ,'com.ustwo.sample:id/commit_list_button_refresh')
    end
end