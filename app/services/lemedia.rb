require 'mechanize'
class Lemedia < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
    agent = Mechanize.new
    page = agent.get('https://lemediapresse.fr/newsletter/')
    pp "on est là"
    pp page
    # Form field
    page.forms[0].field_with(name: 's').value = "#{@con.email}"
    form = page.forms[0]
    pp form
    # Checkboxe
    # page.forms[0].checkboxes.check
    # Submit button
    page.forms[0].submit
  end
end
