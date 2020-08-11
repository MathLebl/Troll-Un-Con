require 'mechanize'
class Atlantico < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
    agent = Mechanize.new
    page = agent.get('https://www.atlantico.fr/category/mots-cles/newsletter')
    # Form field
    atlantico_form = page.forms[1].field_with(:name => 'email')
    atlantico_form.value = "#{@con.email}"
    # Submit button
    page.forms[1].submit
  end
end
