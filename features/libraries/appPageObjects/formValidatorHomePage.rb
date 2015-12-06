class FormValidatorHomePage
  def initialize(driver)
    $driver=driver
         class<<self;
           include AppHeader,AppBody;
         end
  end
end