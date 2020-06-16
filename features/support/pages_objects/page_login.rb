class PageLogin < SitePrism::Page

    element :email, "#email"
    element :password, "#passwd"
    element :sign_in, "#SubmitLogin"
    element :message, ".alert-danger li"
    
    def log_in(data)
        fill_email data['Email']
        fill_pass data['Password']
        sign_in.click
    end
    
    def fill_email(data)
        email.set ''
        email.set data
    end
    
    def fill_pass(data)
        password.set ''
        password.set data
    end 
end    