require 'mechanize'
class Lemedia < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
    agent = Mechanize.new
    page = agent.get('https://lemediapresse.fr/newsletter/')
    lemedia_form = page.forms[0].field_with(:name => 's')
    lemedia_form.value = "michel@gmail.com"
    lemedia_cb = page.forms[0].checkboxes
    lemedia_cb.check
    page.forms[0].submit
  end
end
