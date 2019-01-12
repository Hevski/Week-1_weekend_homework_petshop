require 'pry'

def pet_shop_name(pet_shop)
  pet_shop[:name]
end

def total_cash(monies)
  monies[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
    pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pets)
  pets[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, pets)
  pet_shop[:admin][:pets_sold] += pets
end

def stock_count(pet_shop)
  pet_count = 0
  for pet in pet_shop[:pets]
    pet_count += 1
  end
  pet_count
end

def pets_by_breed(pet_shop, pets)
  specific_breed_array = []
  for pet in pet_shop[:pets]
  if pet[:breed] == pets
  specific_breed_array << pet[:breed]
    end
  end
  specific_breed_array
end

def find_pet_by_name(pet_shop, name_of_pet)
  for pet in pet_shop[:pets]
    if pet[:name] == name_of_pet
      return pet
    end
  end
  nil
end

def remove_pet_by_name(pet_shop, pet_to_remove)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_to_remove
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash(customers)
  customers[:cash]
end

def remove_customer_cash(customer, cash_to_remove)
  customer[:cash] -= cash_to_remove
end

def customer_pet_count(customer)
  customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, new_pet)
  customer[:cash] >= new_pet[:price]
  # worked without the true/false if statement
  # >= always returns t/f???
end

#used pry to check customer funds, pet price,
#customer_can_afford_pet resulting in false
#everything was running because the if pet != was
#true so everything else seemed to run
#finally realised 2 things had to be
#true so used &&, if one was false it would stop, if
#both true it would run everything else

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil && customer_can_afford_pet(customer, pet)
    remove_pet_by_name(pet_shop, pet)
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(pet_shop, pet[:price])
  end
end
