module Helpers
    def create_mass_data()
        data = Hash.new
        data['Email'] = Faker::Internet.email
        data['First Name'] = Faker::Name.first_name
        data['Last Name'] = Faker::Name.last_name
        data['Password'] = Faker::Internet.password(min_length: 8)
        data['Address'] = Faker::Address.street_address
        data['City'] = Faker::Address.city
        data['State'] = Faker::Number.between(from: 2, to: 15)
        data['Zip code'] = Faker::Number.number(digits: 5)
        data['Country'] = 'United States'
        data['Mobile phone'] = Faker::PhoneNumber.cell_phone
        data
    end
end        