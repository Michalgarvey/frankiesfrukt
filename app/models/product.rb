class Product < ApplicationRecord
end

def self.search(term)
  if q
    where('name LIKE ?', "%#{q}%")
  else
    all
  end
end
