require 'mechanize'
class Brief < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
    agent = Mechanize.new
    page = agent.get('https://www.brief.me/')
    # Form field
    page.form.field_with(name: 'email').value = "#{@con.email}"
    # Submit button
    page.form.submit
  end
end
