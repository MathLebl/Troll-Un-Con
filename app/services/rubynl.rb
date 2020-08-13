require 'mechanize'
class Rubynl < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
     puts "on est là"
    agent = Mechanize.new
    page = agent.get('https://rubyweekly.com/')
    # Form field
    page.form.field_with(name: 'email').value = "#{@con.email}"
    # Submit button
    page.form.submit
  end
end
