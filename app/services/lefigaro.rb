require 'mechanize'
class Lefigaro < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
    agent = Mechanize.new
    page = agent.get('https://connect.lefigaro.fr/register')
    # Form fields
    lefigaro_form_first_name = page.forms[0].field_with(:name => 'registration[firstname]')
    lefigaro_form_first_name.value = "John"
    lefigaro_form_last_name = page.forms[0].field_with(:name => 'registration[lastname]')
    lefigaro_form_last_name.value = "Doe"
    lefigaro_form_email = page.forms[0].field_with(:name => 'registration[email]')
    lefigaro_form_email.value = "#{@con.email}"
    lefigaro_form_password = page.forms[0].field_with(:name => 'registration[password]')
    lefigaro_form_password.value = "z/fqjeNNR4*V8cC"
    # Checkboxes
    lefigaro_cb = page.forms[0].checkboxes
    lefigaro_cb.each do |checkbox|
      checkbox.check
    end
    # Radio buttons
    page.forms[0].radiobuttons_with(:name => 'registration[civility]')[1].check
    # Submit buttons
    page.forms[0].submit
  end
end
