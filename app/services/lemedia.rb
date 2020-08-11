require 'mechanize'
class Lemedia < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
    agent = Mechanize.new
    page = agent.get('https://lemediapresse.fr/newsletter/')
    # Form field
    lemedia_form = page.forms[0].field_with(:name => 's')
    lemedia_form.value = "#{@con.email}"
    # Checkboxe
    lemedia_cb = page.forms[0].checkboxes
    lemedia_cb.check
    # Submit button
    page.forms[0].submit
  end
end
