class Con < ApplicationRecord
  enum category: %i[de_gauche de_droite full_frontal]
end
