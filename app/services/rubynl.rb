require 'mechanize'
class Rubynl < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
    agent = Mechanize.new
    page = agent.get('https://rubyweekly.com/')
    rubynl_form = page.form.field_with(:name => 'email')
    rubynl_form.value = "#{@con.email}"
    page.form.submit
  end
end
