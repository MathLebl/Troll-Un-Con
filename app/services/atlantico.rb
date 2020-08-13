require 'mechanize'
class Atlantico < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
    agent = Mechanize.new
    page = agent.get('https://www.atlantico.fr/category/mots-cles/newsletter')
    # Form field
    page.forms[1].field_with(name: 'email').value = "#{@con.email}"
    form = page.forms[1]
    pp form
    # Submit button
    page.forms[1].submit
  end
end
