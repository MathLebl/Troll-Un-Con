require 'mechanize'
class Rubynl < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
    agent = Mechanize.new
    page = agent.get('https://rubyweekly.com/')
    # Form field
    rubynl_form = page.form.field_with(:name => 'email')
    rubynl_form.value = "#{@con.email}"
    # Submit button
    page.form.submit
  end
end
