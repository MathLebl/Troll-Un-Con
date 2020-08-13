require 'mechanize'
class Lefigaro < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
    agent = Mechanize.new
    page = agent.get('https://connect.lefigaro.fr/register')
    # Form fields
    page.forms[0].field_with(name: 'registration[firstname]').value = "#{@con.first_name}"
    page.forms[0].field_with(name: 'registration[lastname]').value = "#{@con.name}"
    page.forms[0].field_with(name: 'registration[email]').value = "#{@con.email}"
    page.forms[0].field_with(name: 'registration[password]').value = "z/fqjeNNR4*V8cC"
    # Checkboxes
    page.forms[0].checkboxes.each(&:check)
    # Radio buttons
    page.forms[0].radiobuttons_with(name: 'registration[civility]')[1].check
    # Submit buttons
    page.forms[0].submit
  end
end
