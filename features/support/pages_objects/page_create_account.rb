class PageCreateAccount < SitePrism::Page
    element :email, "#email_create"
    element :btn_create_account, "#SubmitCreate"
    element :first_name, "#customer_firstname"
    element :last_name, "#customer_lastname"
    element :password, "#passwd"
    element :address, "#address1"
    element :city, "#city"
    element :state, "#uniform-id_state"
    element :zip_code, "#postcode"
    element :mobile_phone, "#phone_mobile"
    element :btn_register, "#submitAccount"
    element :btn_log_out, ".logout"

    def create_account(data)
        fill_email data['Email']
        btn_create_account.click
    end

    def fill_form_create_account(data)
        fill_first_name data['First Name']
        fill_last_name data['Last Name']
        fill_password data['Password']
        fill_address data['Address']
        fill_city data['City']
        fill_state data['State']
        fill_zip_code data['Zip code']
        fill_mobile_phone data['Mobile phone']
        btn_register.click
    end
    
    def fill_email(data)
        email.set ''
        email.set data
    end
    
    def fill_first_name(data)
        first_name.set ''
        first_name.set data
    end
    
    def fill_last_name(data)
        last_name.set ''
        last_name.set data
    end
    
    def fill_password(data)
        password.set ''
        password.set data
    end

    def fill_address(data)
        address.set ''
        address.set data
    end

    def fill_city(data)
        city.set ''
        city.set data
    end

    def fill_state(data)
        state.set ''
        state.find("option:nth-child(#{data})").select_option
    end

    def fill_zip_code(data)
        zip_code.set ''
        zip_code.set data
    end

    def fill_mobile_phone(data)
        mobile_phone.set ''
        mobile_phone.set data
    end
end    