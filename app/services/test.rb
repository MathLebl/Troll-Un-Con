require 'mechanize'

agent = Mechanize.new
page = agent.get('https://lemediapresse.fr/newsletter/')
lemedia_form = page.forms[0].field_with(:name => 's')
lemedia_form.value = "michel@gmail.com"

lemedia_cb = page.forms[0].checkboxes
lemedia_cb.check


# pp page
pp lemedia_form




# mediapart_cb = page.forms[0].checkboxes
# mediapart_cb.map do |checkbox|
#   checkbox.check
# end
# mediapart_form = page.forms[0].field_with(:name => 'MAIL')
# mediapart_form.value = "michel@gmail.com"
# page.forms[0].submit

# second_page = agent.get('https://mediapart.emsecure.net/optiext/optiextension.dll?ID=QtSQWWn_aaLn3bdqou0hEKK609GHLzSs4VlzqZerbMwcmYQzcDj21fSFHaOyWS9%2Be2dbRBpYBP&xtatc=INT-28-[POPIN]')
# second_mediapart_form = second_page.forms[0].field_with(:name => 'MAIL')
# second_mediapart_form.value = "michel@gmail.com"
# second_mediapart_cb = page.forms[0].checkboxes[0]
# second_mediapart_cb.check
# second_page.forms[0].submit

# third_page = agent.get('https://www.atlantico.fr/category/mots-cles/newsletter')
# atlantico_form = third_page.forms[1]


#  form = page.forms[0]
# # pp third_page
# # pp atlantico_form
# pp form
# # pp second_mediapart_cb
