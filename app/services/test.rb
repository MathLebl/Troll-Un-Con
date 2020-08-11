require 'mechanize'

agent = Mechanize.new
page = agent.get('https://connect.lefigaro.fr/register')
# Form fields
lefigaro_form_first_name = page.forms[0].field_with(:name => 'registration[firstname]')
lefigaro_form_first_name.value = "John"
lefigaro_form_last_name = page.forms[0].field_with(:name => 'registration[lastname]')
lefigaro_form_last_name.value = "Doe"
lefigaro_form_email = page.forms[0].field_with(:name => 'registration[email]')
lefigaro_form_email.value = "john-doe@gmail.com"
lefigaro_form_password = page.forms[0].field_with(:name => 'registration[password]')
lefigaro_form_password.value = "z/fqjeNNR4*V8cC"
# Checkboxes
lefigaro_cb = page.forms[0].checkboxes
lefigaro_cb.each do |checkbox|
  checkbox.check
end
# Radio buttons
page.forms[0].radiobuttons_with(:name => 'registration[civility]')[1].check
# Submit buttons
page.forms[0].submit


# lemedia_form.value = "michel@gmail.com"

# lemedia_cb = page.forms[0].checkboxes
# lemedia_cb.check
lefigaro_form = page.forms[0]


# pp page
pp lefigaro_form



# password = "z/fqjeNNR4*V8cC"


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
