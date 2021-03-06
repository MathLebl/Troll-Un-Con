require 'mechanize'
class PartiSocialiste < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
     puts "on est là"
    agent = Mechanize.new
    page = agent.get('https://www.parti-socialiste.fr/rejoindre_la_newsletter')
    # Form fields
    page.forms[0].field_with(name: 'signup[first_name]').value = "#{@con.first_name}"
    page.forms[0].field_with(name: 'signup[last_name]').value = "#{@con.name}"
    page.forms[0].field_with(name: 'signup[email]').value = "#{@con.email}"
    page.forms[0].field_with(name: 'signup[mobile_number]').value = "#{@con.phone}"
    page.forms[0].field_with(name: 'signup[submitted_address]').value = "#{@con.postal}"
    # Radio buttons
    page.forms[0].radiobuttons_with(name: 'signup[labeled_tags][]')[0].check
    page.forms[0].radiobuttons_with(name: 'consents[3]')[1].check
    # Submit button
    page.forms[0].submit
  end
end
