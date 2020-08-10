require 'mechanize'
class Brief < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
    agent = Mechanize.new
    page = agent.get('https://www.brief.me/')
    brief_form = page.form.field_with(:name => 'email')
    brief_form.value = "#{@con.email}"
    page.form.submit
    pp page
    pp brief_form
  end
end
