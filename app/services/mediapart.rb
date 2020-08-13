require 'mechanize'
class Mediapart < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
    agent = Mechanize.new
    # First Page
    page = agent.get('https://info.mediapart.fr/optiext/optiextension.dll?ID=Ji6JBWdfKWQY92jHH5SwqYctTQS4hqE4m5qbo4RRNS1jtE6RBmNuN7nmx5CNECt0mmvi0CveRf')
    # Form field
    page.forms[0].field_with(name: 'MAIL').value = "#{@con.email}"
    # Checkboxes
    page.forms[0].checkboxes.each(&:check)
    # Submit button
    page.forms[0].submit
    # Second Page
    second_page = agent.get('https://mediapart.emsecure.net/optiext/optiextension.dll?ID=QtSQWWn_aaLn3bdqou0hEKK609GHLzSs4VlzqZerbMwcmYQzcDj21fSFHaOyWS9%2Be2dbRBpYBP&xtatc=INT-28-[POPIN]')
    # Form field
    second_page.forms[0].field_with(name: 'MAIL').value = "#{@con.email}"
    # Checkboxe
    page.forms[0].checkboxes[0].check
    # Submit button
    second_page.forms[0].submit
  end
end
