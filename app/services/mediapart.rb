require 'mechanize'
class Atlantico < ApplicationService
  def initialize(con)
    @con = con
  end

  def call
    agent = Mechanize.new
    page = agent.get('https://info.mediapart.fr/optiext/optiextension.dll?ID=Ji6JBWdfKWQY92jHH5SwqYctTQS4hqE4m5qbo4RRNS1jtE6RBmNuN7nmx5CNECt0mmvi0CveRf')
    mediapart_cb = page.forms[0].checkboxes
    mediapart_cb.map do |checkbox|
      checkbox.check
    end
    mediapart_form = page.forms[0].field_with(:name => 'MAIL')
    mediapart_form.value = "#{@con.email}"
    page.forms[0].submit

    second_page = agent.get('https://mediapart.emsecure.net/optiext/optiextension.dll?ID=QtSQWWn_aaLn3bdqou0hEKK609GHLzSs4VlzqZerbMwcmYQzcDj21fSFHaOyWS9%2Be2dbRBpYBP&xtatc=INT-28-[POPIN]')
    second_mediapart_form = second_page.forms[0].field_with(:name => 'MAIL')
    second_mediapart_form.value = "#{@con.email}"
    second_mediapart_cb = page.forms[0].checkboxes[0]
    second_mediapart_cb.check
    second_page.forms[0].submit
  end
end
