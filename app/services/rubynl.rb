require 'mechanize'
class Rubynl < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
    agent = Mechanize.new
    page = agent.get('https://rubyweekly.com/')
    brief_form = page.form.field_with(:name => 'email')
    brief_form.value = "#{@con.email}"
    page.form.submit
  end
end
